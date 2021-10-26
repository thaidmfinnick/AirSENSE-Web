var mqtt = require('mqtt')
var events = require('events');
emitter = new events.EventEmitter();
const config = require('config');
var mysql = require('mysql');

var con = mysql.createConnection(config.get('database'));

var connectStatus = 'idle';

class BlockMemory {
    constructor() {
        this.status = 'available'
        this.memory = [];
    }

    add(record) {
        this.memory.push(record);
        try{
            if (this.isFull()) this.saveAll();
        }catch(e){}
    }

    isFull() {
        return this.memory.length === config.maxItemMemory;
    }

    isAvailable() {
        return !(this.isFull() || this.status == 'pending');
    }

    clearMemory() {
        this.memory = []
    }

    saveAll() {
        var self = this;
        this.status = 'pending';
        var columns = [], fields = [];
        for(var field in config.fields) {
            columns.push(field);
        }
        columns = '(' + columns.join() +')';
        this.memory.map(record => {
            var values = [];
            for(field in record) {
                if( record[field] ) {
                    values.push(record[field]);
                } else values.push('NULL');    
            }
            values = '(' + values.join() + ')';
            fields.push(values);
        })
        fields = fields.join();
        var sql = "INSERT INTO sparc_sensor_data "+ columns +" VALUES " + fields;
        if (connectStatus === 'idle') {
            connectStatus = 'busy';
            con.query(sql, function (err, result) {
                if (err) throw err;
                connectStatus = 'idle'
                self.clearMemory();
            });
        } else {
            var saveInterval = setInterval(function () {
                if (connectStatus === 'idle') {
                    connectStatus = 'busy';
                    con.query(sql, function (err, result) {
                        if (err) throw err;
                        connectStatus = 'idle'
                        self.clearMemory();
                    });
                    clearInterval(saveInterval);
                }
            }, 1000)
        }
    }
}

var SaveFactory = (function(){
    class Save {
        constructor() {
            this.memFirst = new BlockMemory();
            this.memSecond = new BlockMemory();
        }
    
        save(record) {
            if (this.memFirst.isAvailable()) {
                this.memFirst.add(record);
            } else this.memSecond.add(record);
        }
    }

    var instance;
    return {
        getInstance: function(){
        if (!instance) {
            instance = new Save();
            delete instance.constructor;
        }
        return instance;
        }
    };
})();


var mqttConfig = config.mqtt;
var clients = [];
mqttConfig.map(config => {
    config.clientId = 'mqttjs_' + Math.random().toString(16).substr(2, 8);
    var client = mqtt.connect('http://mqtt.airsense.vn/', config);
    clients.push(client);
    client.on('connect', function () {
        client.subscribe('#', function (err) {
            if (!err) {
                console.log("Connect mqtt successfully in port:", config.port);
            }
            else
                console.log(err);
        })
    })
})


var save = SaveFactory.getInstance();

clients.map(client => {
    client.on('message', function (topic, message, packet) {
        try{
            message = JSON.parse(message.toString('utf-8'));
            var record = Object.assign({}, config.fields);
            for(property in record) {
                if(message[property] != undefined) {
                    record[property] = message[property];
                }
            }
            var current = + new Date();
            current = current/1000;
            //bo qua ban ghi co thoi gian lon hon thoi gian hien tai 24h
            if(record.Time>(current+24*60*3600)) {
                return;
            }
            if(message.StationId!=null && message.StationId != '' ) {
                record.station_id = parseInt(message.StationId, 16);
                // console.log(record);
                save.save(record);
            }
        } catch(e) {
        }
    });
})




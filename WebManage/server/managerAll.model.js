
const Adress = require('./adress.model.js');
const GroupContent = require('./groupContent.model.js');
const PagesContent = require('./PagesContent.model.js');
const GroupContentSub = require('./groupContentSub.model.js');
const User = require('./user.model.js');
const SparcPosts = require('./sparcPosts.model');
const SparcSensorWarning = require('./sparcSensorWarning.model');
const SparcSensorMaxMin = require('./sparcSensorMaxMin.model');
const SparcSensorData = require('./sparcSensorData.model');
const SparcAcessLocationSensor = require('./sparcAcessLocationSensor.model');
const SparcGroupLocationSensor = require('./sparcGroupLocationSensor.model');
const SparcAqi = require('./sparcAqi.model');
const SparcLocationSensor = require('./sparcLocationSensor.model');

// Course
const GroupCourse = require('./groupCourse.model');
const Course = require('./course.model');
const PagesCourse = require('./PagesCourse.model');



const classesFactory = {User ,Adress,GroupContent,
    PagesContent,GroupContentSub,
    SparcPosts,SparcSensorWarning,SparcSensorMaxMin,SparcSensorData,SparcAcessLocationSensor,
    SparcGroupLocationSensor,SparcAqi ,SparcLocationSensor};
const classesFactorryMapping = {  users:"User" , adress:"Adress" ,
                            group_content:"GroupContent" ,
                            pages_content:"PagesContent",group_content_sub:"GroupContentSub",
                            sparc_posts:"SparcPosts",sparc_sensor_warning:"SparcSensorWarning",
                            sparc_sensor_max_min:"SparcSensorMaxMin",sparc_sensor_data:"SparcSensorData",
                            sparc_access_location_sensor:"SparcAcessLocationSensor",
                            sparc_group_location_sensor:"SparcGroupLocationSensor",sparc_aqi:"SparcAqi",
                            sparc_location_sensor:"SparcLocationSensor", 
                            group_course: "GroupCourse", course: "Course", pages_course: "PageCourse"
                        };
                        
const classesFactorryMappingUser = {  adress:"Adress" ,
                        group_content:"GroupContent" ,
                        pages_content:"PagesContent",group_content_sub:"GroupContentSub",
                        sparc_posts:"SparcPosts",sparc_sensor_warning:"SparcSensorWarning",
                        sparc_sensor_max_min:"SparcSensorMaxMin",sparc_sensor_data:"SparcSensorData",
                        sparc_access_location_sensor:"SparcAcessLocationSensor",
                        sparc_group_location_sensor:"SparcGroupLocationSensor",sparc_aqi:"SparcAqi",
                        group_course: "GroupCourse", course: "Course", pages_course: "PageCourse"
                    };      


exports.mangerModelAdmin = function  (table) {
    var nameConvert=classesFactorryMapping[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect) return tableSelect;
    }
    return false;
};

exports.mangerModelUser = function  (table) {
    var nameConvert=classesFactorryMappingUser[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect) return tableSelect;
    }
    return false;
};
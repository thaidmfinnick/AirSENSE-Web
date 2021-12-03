const bookshelf = require('../config/bookshelf.js');
const HttpStatus = require('http-status-codes');
const DocumentFileAndFloder = require('../models/DocumentFileAndFloder.js');
var documentFileAndFloder =new DocumentFileAndFloder();
var squel = require("squel");
const knex = require('../config/knex.js');
var documentCtrl={};
const urlHost = (process.env.APP_HOST || 'localhost')+":"+ (process.env.APP_PORT || 3000);


documentCtrl.postAddPageToDataBase  = function(request, res) {       
        let content=request.body["content"] ;
        let content_html=request.body["content_html"] ;
        let group=request.body["group_file"];
        let group_content_sub_id = request.body["group_content_sub_id"];
        // save file
        var link= documentFileAndFloder.createNewfile(content_html,'storeHtml');
        if(link==null){
            res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                error: true,
                data: { message: err.message },
              })
        }
        else
        {
            var addData = squel.insert().into('pages_content')
            // save data Sql
            addData.set("group_content_sub_id",group_content_sub_id)
            .set("group_file",group)
            .set("filesave",link)
            .set("title",request.body["title"])
            .set("content",request.body["content"])
            .set("is_main_pages_id",request.body["is_main_pages_id"])
            .set("content_img",request.body["content_img"])
            .set("id_created",request.currentUser.users_id)
            .set("id_updated",request.currentUser.users_id)
            .set("created_at","NOW()",{dontQuote: true}) 
            .set("updated_at","NOW()",{dontQuote: true})
            .set("deleteflag",0);
            knex.raw(addData.toString()).then(function(x) {
                return res.status(HttpStatus.OK).json({
                    data: x
                });  
            })
            .catch(function(err){
                return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                    error: true,
                    detail:err,
                    data:  "Database inval"
                });     
            });
        }
 
}


documentCtrl.postUpdatePageToDataBase  = function(request, res) {       
    let content=request.body["content"] ;
    let content_html=request.body["content_html"] ;
    let group=request.body["group_file"];
    let group_content_sub_id = request.body["group_content_sub_id"];
    // save file
    var link= documentFileAndFloder.createNewfile(content_html,'storeHtml');
    if(link==null){
        res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
            error: true,
            data: { message: err.message },
          })
    }
    else
    {
        var addData = squel.update().table('pages_content')
        // save data Sql
        addData.set("group_content_sub_id",group_content_sub_id)
        .set("group_file",group)
        .set("filesave",link)
        .set("title",request.body["title"])
        .set("content",request.body["content"])
        .set("is_main_pages_id",request.body["is_main_pages_id"])
        .set("content_img",request.body["content_img"])
        .set("id_created",request.currentUser.users_id)
        .set("id_updated",request.currentUser.users_id)
        .set("updated_at","NOW()",{dontQuote: true})
        .set("deleteflag",0)
        .where('pages_content_id='+request.body['pages_content_id']);
        knex.raw(addData.toString()).then(function(x) {
            return res.status(HttpStatus.OK).json({
                data: x
            });  
        })
        .catch(function(err){
            return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                error: true,
                detail:err,
                data:  "Database inval"
            });     
        });
    }

}


// Document Course
documentCtrl.postAddCourseToDataBase  = function(request, res) {       
    let content=request.body["content"] ;
    let content_html=request.body["content_html"] ;
    let group=request.body["group_file"];
    let course_id = request.body["course_id"];
    // save file
    var link= documentFileAndFloder.createNewfile(content_html,'storeHtml');
    if(link==null){
        res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
            error: true,
            data: { message: err.message },
          })
    }
    else
    {
        var addData = squel.insert().into('pages_course')
        // save data Sql
        addData.set("course_id",course_id)
        .set("group_file",group)
        .set("filesave",link)
        .set("title",request.body["title"])
        .set("content",request.body["content"])
        .set("is_main_pages_id",request.body["is_main_pages_id"])
        .set("content_img",request.body["content_img"])
        .set("id_created",request.currentUser.users_id)
        .set("id_updated",request.currentUser.users_id)
        .set("created_at","NOW()",{dontQuote: true}) 
        .set("updated_at","NOW()",{dontQuote: true})
        .set("deleteflag",0);
        knex.raw(addData.toString()).then(function(x) {
            return res.status(HttpStatus.OK).json({
                data: x
            });  
        })
        .catch(function(err){
            return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                error: true,
                detail:err,
                data:  "Database inval"
            });     
        });
    }

}


documentCtrl.postUpdateCourseToDataBase  = function(request, res) {       
let content=request.body["content"] ;
let content_html=request.body["content_html"] ;
let group=request.body["group_file"];
let course_id = request.body["course_id"];
// save file
var link= documentFileAndFloder.createNewfile(content_html,'storeHtml');
if(link==null){
    res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
        error: true,
        data: { message: err.message },
      })
}
else
{
    var addData = squel.update().table('pages_course')
    // save data Sql
    addData.set("course_id",course_id)
    .set("group_file",group)
    .set("filesave",link)
    .set("title",request.body["title"])
    .set("content",request.body["content"])
    .set("is_main_pages_id",request.body["is_main_pages_id"])
    .set("content_img",request.body["content_img"])
    .set("id_created",request.currentUser.users_id)
    .set("id_updated",request.currentUser.users_id)
    .set("updated_at","NOW()",{dontQuote: true})
    .set("deleteflag",0)
    .where('pages_content_id='+request.body['pages_course_id']);
    knex.raw(addData.toString()).then(function(x) {
        return res.status(HttpStatus.OK).json({
            data: x
        });  
    })
    .catch(function(err){
        return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
            error: true,
            detail:err,
            data:  "Database inval"
        });     
    });
}

}

// 
documentCtrl.postAddAdvertisementToDataBase  = function(request, res) {       
    let content=request.body["content"] ;
    let content_html=request.body["content_html"] ;
    let group=request.body["group_file"];
    let group_content_sub_id = request.body["group_content_sub_id"];
    // save file
    var link= documentFileAndFloder.createNewfile(content_html,'storeHtml');
    if(link==null){
        res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
            error: true,
            data: { message: err.message },
          })
    }
    else
    {
        var addData = squel.insert().into('advertisement_content')
        // save data Sql
        addData.set("group_content_sub_id",group_content_sub_id)
        .set("group_file",group)
        .set("filesave",link)
        .set("title",request.body["title"])
        .set("content",request.body["content"])
        .set("set_to_fist",0)
        .set("content_img",request.body["content_img"])
        .set("id_created",request.currentUser.users_id)
        .set("id_updated",request.currentUser.users_id)
        .set("created_at","NOW()",{dontQuote: true}) 
        .set("updated_at","NOW()",{dontQuote: true})
        .set("deleteflag",0);
        knex.raw(addData.toString()).then(function(x) {
            return res.status(HttpStatus.OK).json({
                data: x
            });  
        })
        .catch(function(err){
            return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                error: true,
                detail:err,
                data:  "Database inval"
            });     
        });
    }

}


documentCtrl.postUpdateAdvertisementToDataBase  = function(request, res) {       
    let content=request.body["content"] ;
    let content_html=request.body["content_html"] ;
    let group=request.body["group_file"];
    let group_content_sub_id = request.body["group_content_sub_id"];
    // save file
    var link= documentFileAndFloder.createNewfile(content_html,'storeHtml');
    if(link==null){
        res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
            error: true,
            data: { message: err.message },
        })
    }
    else
    {
        var addData = squel.update().table('advertisement_content')
        // save data Sql
        addData.set("group_content_sub_id",group_content_sub_id)
        .set("group_file",group)
        .set("filesave",link)
        .set("title",request.body["title"])
        .set("content",request.body["content"])
        .set("set_to_fist",request.body["set_to_fist"])
        .set("content_img",request.body["content_img"])
        .set("id_created",request.currentUser.users_id)
        .set("id_updated",request.currentUser.users_id)
        .set("updated_at","NOW()",{dontQuote: true})
        .set("deleteflag",0)
        .where('advertisement_id='+request.body['advertisement_id']);
        knex.raw(addData.toString()).then(function(x) {
            return res.status(HttpStatus.OK).json({
                data: x
            });  
        })
        .catch(function(err){
            return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                error: true,
                detail:err,
                data:  "Database inval"
            });     
        });
    }

}

documentCtrl.getAllInMenuPage  = async function(listID) {
    var sql= "SELECT pages_content.*,group_content_sub.group_content , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT pages_content.*, @n := if(group_content_sub_id != @prev, 1, @n + 1) AS n, @prev := group_content_sub_id FROM pages_content WHERE pages_content.deleteflag =0 AND pages_content.is_main_pages_id<1 and group_content_sub_id IN("
                +listID+") ORDER BY set_to_fist ,pages_content_id DESC) pages_content LEFT JOIN group_content_sub on group_content_sub.group_content_sub_id=pages_content.group_content_sub_id WHERE n <= 2 "

    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        var subjects =[];
        var idItem=-1;
        for(var i=0;i<x[0].length;i++)
        {
            var itemPage = x[0][i];
            if(!!itemPage){
                console.log("documentCtrl.getAllInMenuPage  .......>.",itemPage.group_content_sub_id);
                if(itemPage.group_content_sub_id!=idItem){
                    subjects.push({title:itemPage.group_content,items:[]});
                    idItem= itemPage.group_content_sub_id;
                }
                if(itemPage.is_main_pages_id==-1){
                    subjects[subjects.length-1].items.push({ title: itemPage.title , route:'/group_page/'+
                                itemPage.pages_content_id, typePage: itemPage.title });
                }
                else
                {
                    subjects[subjects.length-1].items.push({ title: itemPage.title , route:'/detail_page/'+
                                itemPage.filesave.replace('/', '+'), typePage: itemPage.title });
                }

                
            }
            console.log("documentCtrl.getAllInMenuPage  itemPageitemPage.group_content_sub_id",i,x[0].length);
           
        }
        console.log("documentCtrl.getAllInMenuPage subjects",subjects);
        return subjects;
    }
    return [];
}

documentCtrl.getAllContentDetailPage  = async function(listID) {
    var sql= "SELECT pages_content.*,group_content_sub.group_content , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT pages_content.*, @n := if(group_content_sub_id != @prev, 1, @n + 1) AS n, @prev := group_content_sub_id FROM pages_content WHERE pages_content.deleteflag =0 AND pages_content.is_main_pages_id<1  and group_content_sub_id IN("
                +listID+") ORDER BY set_to_fist ,pages_content_id DESC) pages_content LEFT JOIN group_content_sub on group_content_sub.group_content_sub_id=pages_content.group_content_sub_id WHERE n <= 10 ";

    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        return x[0];
    }
    return [];
}

// Course 
documentCtrl.getAllContentDetailCourse  = async function(listID) {
    var sql= "SELECT pages_course.*,course.group_course , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT pages_course.*, @n := if(course_id != @prev, 1, @n + 1) AS n, @prev := course_id FROM pages_course WHERE pages_course.deleteflag=0 AND pages_course.is_main_pages_id<1  and course_id IN("
                +listID+") ORDER BY set_to_fist ,pages_course_id DESC) pages_course LEFT JOIN course on course.course_id=pages_course.course_id WHERE n <= 10 ";

    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        return x[0];
    }
    return [];
}

documentCtrl.getAllContentLatestPage  = async function(listID) {
    var sql= "SELECT pages_content.*,group_content_sub.group_content , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT pages_content.*, @n := if(group_content_sub_id != @prev, 1, @n + 1) AS n, @prev := group_content_sub_id FROM pages_content WHERE pages_content.deleteflag =0 AND pages_content.is_main_pages_id<1  and group_content_sub_id IN("
                +listID+") ORDER BY id_created DESC) pages_content LEFT JOIN group_content_sub on group_content_sub.group_content_sub_id=pages_content.group_content_sub_id WHERE n <= 10 ";

    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        return x[0];
    }
    return [];
}

// Course
documentCtrl.getAllContentLatestCourse  = async function(listID) {
    var sql= "SELECT pages_course.*,course.group_course , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT pages_course.*, @n := if(course_id != @prev, 1, @n + 1) AS n, @prev := course_id FROM pages_course WHERE pages_course.deleteflag =0 AND pages_course.is_main_pages_id<1  and course_id IN("
                +listID+") ORDER BY id_created DESC) pages_course LEFT JOIN course on course.course_id=pages_course.course_id WHERE n <= 10 ";

    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        return x[0];
    }
    return [];
}

documentCtrl.getAllContentStartPage  = async function() {
    var sql=  "SELECT pages_content.*,group_content_sub.group_content , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT pages_content.*, @n := if(group_content_sub_id != @prev, 1, @n + 1) AS n, @prev := group_content_sub_id FROM pages_content WHERE pages_content.deleteflag =0 AND pages_content.is_main_pages_id<1 ORDER BY group_content_sub_id,set_to_fist,pages_content_id DESC) pages_content LEFT JOIN group_content_sub on group_content_sub.group_content_sub_id=pages_content.group_content_sub_id WHERE n <= 2";
    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        for(var i=0;i<x[0].length;i++){
            x[0][i].filesave =  x[0][i].filesave.replace('/', '+');
        }
        return x[0];
    }
    return [];
}

documentCtrl.getAllInGroupPage  = async function(request) {
    console.log("sqlraw.toString() ........... request.body..",request.body);
    var is_main_pages_id = request.body['is_main_pages_id'];
    var sqlraw = squel.select().from('pages_content')
        .where('deleteflag=0')
        .where('is_main_pages_id='+is_main_pages_id
                +" OR pages_content_id ="+is_main_pages_id );
        console.log("sqlraw.toString() .............",sqlraw.toString());
    var x= await knex.raw(sqlraw.toString());
    if ((x!=null)&&(x.length>0)) {
        for(var i=0;i<x[0].length;i++){
            x[0][i].filesave = '/detail_page/'+ x[0][i].filesave.replace('/', '+');
        }
        return x[0];
    }
    return [];
}

// Course
documentCtrl.getAllInGroupCourse  = async function(request) {
    console.log("sqlraw.toString() ........... request.body..",request.body);
    var is_main_pages_id = request.body['is_main_pages_id'];
    var sqlraw = squel.select().from('pages_course')
        .where('deleteflag=0')
        .where('is_main_pages_id='+is_main_pages_id
                +" OR pages_course_id ="+is_main_pages_id );
        console.log("sqlraw.toString() .............",sqlraw.toString());
    var x= await knex.raw(sqlraw.toString());
    if ((x!=null)&&(x.length>0)) {
        for(var i=0;i<x[0].length;i++){
            x[0][i].filesave = '/detail_lesson/'+ x[0][i].filesave.replace('/', '+');
        }
        return x[0];
    }
    return [];
}

documentCtrl.getAllContentAdvertisement  = async function() {
    var sql= " SELECT advertisement_content.*,group_content_sub.group_content , n FROM ( SELECT @prev := '', @n := 0 ) init JOIN ( SELECT advertisement_content.*, @n := if(group_content_sub_id != @prev, 1, @n + 1) AS n, @prev := group_content_sub_id FROM advertisement_content WHERE advertisement_content.deleteflag =0 ORDER BY set_to_fist ,advertisement_id DESC) advertisement_content LEFT JOIN group_content_sub on group_content_sub.group_content_sub_id=advertisement_content.group_content_sub_id WHERE n <= 1 ;";
    var x= await knex.raw(sql);
    if ((x!=null)&&(x.length>0)) {
        return x[0];
    }
    return [];
}


module.exports =documentCtrl;
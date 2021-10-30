
const BlogManager = require("../models/manager/BlogManager");
var blogManager= new BlogManager();
var iotCtrl={};




iotCtrl.getTotalPosts = function(request, response) {
    blogManager.getTotalPosts().then(function(result) {
        response.send(JSON.stringify({total:result}));
    })
};
iotCtrl.getPostsPagination = function(request, response) {
    var pageSize = request.query.pageSize;
    var pageNumber = request.query.pageNumber;
    blogManager.getPostsPagination(pageSize, (pageNumber-1)*pageSize).then(function(result) {
        response.send(JSON.stringify(result));
    });
};

iotCtrl.getPosts= function(request, response) {
    blogManager.getPosts().then(function(result) {
        response.send(JSON.stringify(result));
    })
}

iotCtrl.savePost= function(request, response) {
    var post = request.body;
    blogManager.savePost(post).then(function(result) {
        response.send(JSON.stringify(result));
    })
}


module.exports = iotCtrl;

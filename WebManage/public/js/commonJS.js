
function setItemFormITemAds(item){
    var html=' <div class="sb-img-hust-tech ">  <img class="image-hust-tech" src ="'+item.content_img+'"/>'
                +'</div>' 
                +'<div class="div-left-hust-tech"> <label class="sb-font-hust-tech" >'
                +item.title+'</label></div>' ;
    return html;
}

function setFormToMenuShowAds(dataJson,itemToSet){
    var textHtml="";
    for(var i =0;i<dataJson.length;i++){
        if(dataJson[i].is_main_pages_id==-1){
            textHtml += ' <a class="side-menu-item sb-border-hust-tech"  href="../group_page/'+
               dataJson[i].pages_content_id +'" >'+setItemFormITemAds(dataJson[i])+'</a>'; 
        }
        else
        {
            var linkEdit= dataJson[i].filesave.replaceAll('/', '+');
            textHtml += ' <a class="side-menu-item sb-border-hust-tech"  href="../detail_page/'+
            linkEdit +'" >'+setItemFormITemAds(dataJson[i]) +'</a>'; 
        }
    }
    $(itemToSet).html(textHtml); 
  }



  function setFormToShowPages(item,urlDetail){
    var start =  '<div class="ItemBlog">';
    var limkUrl= '<a href="'+urlDetail;
    if(item.is_main_pages_id==-1){
      limkUrl += 'group_page/'+item.pages_content_id + '\"style="" class="btn btn-primary">Xem thêm</a>';
      }
      else
      {
        limkUrl +='detail_page/'+ item.filesave.replace('/', '+')+ '\"style="" class="btn btn-primary">Xem thêm</a>';
      }
      // console.log(limkUrl)
      var content = 
        '<div class="col-sm-4 col-md-4"><div class="card">'           
      + '<img src="' +item.content_img +'" alt="images"  class="card-img-top"/> <div class="card-body">'
      +'<h5 class="card-title">'+item.title +'</h5> <p class="card-text">' +item.content
      + '</p>'+ limkUrl +'</div></div></div></div>';
      console.log(content)
    return (start+content);
  }


    function  getInfoDetailPages(nameDivControl,dataView,urlDetail){
        $.ajax({
            type: 'GET',
            enctype: 'multipart/form-data',
            url: '/api/document/document_detail/'+dataView,
            data: {},
            processData: false, //prevent jQuery from automatically transforming the data into a query string
            contentType: false,
            cache: false,
            success: (data) => {
            console.log(data);
               var dataJson = JSON.parse(data);
               console.log(dataJson);
               var textHtml ="";
               dataJson= dataJson.sort(function (a, b) {
                       return (a.group_content_sub_id-b.group_content_sub_id);
               });
               console.log(dataJson);
               var titleSub="";
               var startRow = '<div class="row" style="display: grid; grid-template-columns: repeat(3, 1fr);">'
               var closeRow = '</div>'
               for(var i =0;i<dataJson.length;i++){
                 if(dataJson[i].group_content!=titleSub) {
                   if (dataJson[i] == 0) {
                    titleSub = dataJson[i].group_content;
                    textHtml+= "<center><H2>"+titleSub+"</H2></center>" + startRow;
                   }
                   else {
                    textHtml += closeRow;
                    titleSub = dataJson[i].group_content;
                    textHtml+= "<center><H2>"+titleSub+"</H2></center>" + startRow;
                   }
                 }
                 textHtml += setFormToShowPages(dataJson[i],urlDetail);
               }
               textHtml += closeRow;
               console.log(textHtml);
               $('#'+nameDivControl).html(textHtml); //.replaceAll("</p>","<br/>").replaceAll("<p>","<br/>")
            },
            error: (e) => {
            console.log(e.responseText);
            },
        });
    }

    function getInfoAbs(nameDivControl,dataView) {
      $.ajax({
        type: 'GET',
        enctype: 'multipart/form-data',
        url: '/api/document/lastest_detail/'+dataView,
        data: {},
        processData: false, //prevent jQuery from automatically transforming the data into a query string
        contentType: false,
        cache: false,
        success: (data) => {
        console.log(data);
          var dataJson = JSON.parse(data);
          console.log(dataJson);
          setFormToMenuShowAds(dataJson, nameDivControl); 
        },
        error: (e) => {
        console.log(e.responseText);
        },
      });
    }

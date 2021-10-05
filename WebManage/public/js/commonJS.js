

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
      var start =  '<div class="rs-about style9 pt-20 md-pt-70"><div class="container container-title-hust-tech">';
      var limkUrl= '<a href="'+urlDetail;
      if(item.is_main_pages_id==-1){
        limkUrl += 'group_page/'+item.pages_content_id +'" style="font-size: 20px;">';
        }
        else
        {
          limkUrl +='detail_page/'+ item.filesave.replace('/', '+')+' " style="font-size: 20px;">';
        }
      
      var content = ' <div class="row align-items-center">  <div class="col-lg-3"> <div class="img-part js-tilt">'           
                 + '<img src="' +item.content_img +'" alt="images"  />  </div> </div>'
                 +'<div class="col-lg-9"> <div class="div-font-title-hust-tech">'+item.title +'</div> <div class="content div-font-info-hust-tech "><br/>' +item.content
                 + '</div></div></div></div></div>';

      return (limkUrl +start+content + ' </a>');
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
               for(var i =0;i<dataJson.length;i++){
                 if(dataJson[i].group_content!=titleSub){
                   titleSub = dataJson[i].group_content;
                   textHtml+= "<center><H2>"+dataJson[i].group_content+"</H2></center>";
                 }
                 textHtml += setFormToShowPages(dataJson[i],urlDetail);
               }
               
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



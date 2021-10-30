

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
      var start =  '<div class="p-3"><div class="container container-title-hust-tech">';
      var limkUrl= '<a href="'+urlDetail;
      if(item.is_main_pages_id==-1){
        limkUrl += 'group_page/'+item.pages_content_id +'" style="font-size: 20px;">';
        }
        else
        {
          limkUrl +='detail_page/'+ item.filesave.replace('/', '+')+' " style="font-size: 20px;">';
        }
      
      var content = ' <div class="row align-items-center">  <div class="col-lg-3"> <div class="img-part js-tilt">'           
                 + '<img src="' +item.content_img +'" alt="images"  style="width: 60%"/>  </div> </div>'
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


    
function checkUserAuthen2() {
  var mname = localStorage.getItem("tocken_LVC");
  $.ajax({
      type: 'post',
      dataType: 'json',
      url: '/user',
      data: {
          user: "check"
      },
      beforeSend: function (xhr) {
          xhr.setRequestHeader('Authorization', 'Bearer ' + mname);
      },
      success: function (authen) {
          console.log('authen success');
          if (!authen) {
              $("#managerAuthen").attr("href", "login");
              $("#managerAuthen").html('Login');
              window.location.href = "/login";
          }

      },
      complete: function (authen) {
          console.log('authen complete')
          console.log(authen.responseText);
      },
      error: function (authen) {
          console.log('authen error');
          console.log(authen);
      }
  });
}

function checkUserAuthenSecsion() {
  localStorage.setItem("role", "none");
  var mname = localStorage.getItem("tocken_LVC");
  $.ajax({
      type: 'post',
      dataType: 'json',
      url: '/user',
      data: { user: "check" },
      beforeSend: function (xhr) {
          xhr.setRequestHeader('Authorization', 'Bearer ' + mname);
      },
      success: function (authen) {
          if(authen == false) {
              console.log("authen falsejjjj")
              $("#managerAuthen").attr("href", "login");
              $("#managerAuthen").html('Login');
              window.location.href = "/login";
          }
          localStorage.setItem("role", authen.role);
          var role = localStorage.getItem("role");
          if(role=="manager" || role =="supporter") {
              $('#report-station').show();
              $('#manager-station').show();
          }
          if(role=="manager") {
              $('#manage-user').show();
              $('#manage-blog').show();
          }
      },
      error: function (authen) {
          console.log('authen error')
          console.log(authen);
          $("#managerAuthen").attr("href", "login");
          $("#managerAuthen").html('Login');
          window.location.href = "/login";
      }
  });
}

function gotoRegister() {
  window.location.href = "/register";
}
function gotoCheckUserStorage() {
  var userData = localStorage.getItem("name_LVC");
  if (userData) {
      $("#managerAuthen").attr("href", "profile");
      $("#managerAuthen").html(userData);
      $("#managerLogout").attr("href", "logout");
      $("#managerLogout").html("Đăng xuất");
  }
  else {
      $("#managerAuthen").attr("href", "login");
      $("#managerAuthen").html('Login');
      $("#managerLogout").attr("href", "logout");
      $("#managerLogout").html("");
  }
}

function showLoader() {
  document.getElementById("loader-container").style.display = 'block';
}

function hideLoader() {
  document.getElementById("loader-container").style.display = 'none';
}

function notify(message, status) {
  var x = document.getElementById("snackbar");
  x.innerHTML  = message;
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
  document.getElementById("snackbar").classList.add(status);
}


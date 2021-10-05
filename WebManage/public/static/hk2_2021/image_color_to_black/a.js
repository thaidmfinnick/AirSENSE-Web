function chooseFile(){
    var a= document.getElementById('fileInput');

    a.click();
}

function previewFile(fileInput){
	var reader = new FileReader();
	reader.onload = function (e) {
		var img = document.getElementById("selected_img");
		img.src = e.target.result;
		img.style.display = "inline-block";
	};
	reader.readAsDataURL(fileInput.files[0]);
}

function chuyendoianh(chuyendoi){
    var readers = new FileReader();
    readers.onload = function(x){
        var changeimg = document.getElementById("image")
        changeimg.src = x.target.result;
        changeimg.style.display="inline-block";
    };
    readers.readAsDataURL(fileInput.files[0]);
}
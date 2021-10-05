var input = document.getElementById('input');
var result = document.getElementById('result');
var inputType = document.getElementById('inputType');
var resultType = document.getElementById('resultType');
var inputTypeValue,resultTypeValue;

input.addEventListener("keyup",myResult);
inputType.addEventListener("change",myResult);
resultType.addEventListener("change",myResult);

inputTypeValue = inputType.value;
resultTypeValue = resultType.value;


function myResult(){

	inputTypeValue = inputType.value;
	resultTypeValue = resultType.value;


	if(inputTypeValue === "cm" && resultTypeValue==="inch"){
		result.value = Number(input.value) * 0.39;
	}else if(inputTypeValue === "cm" && resultTypeValue==="km"){
		alert('Không đổi cm sang km được!');
    }else if(inputTypeValue === "cm" && resultTypeValue==="pound"){
		alert('Không đổi cm sang pound được!'); }


	if(inputTypeValue === "mile" && resultTypeValue==="km"){
		result.value = Number(input.value) * 1.609;
	}else if(inputTypeValue === "mile" && resultTypeValue==="inch"){
		alert('Không đổi Dặm sang inch được!')
	}else if(inputTypeValue === "mile" && resultTypeValue==="pound"){
		alert('Không đổi Dặm sang pound được!')
	}

	if(inputTypeValue === "kg" && resultTypeValue==="pound"){
		 result.value = Number(input.value) * 2.20;
	}else if(inputTypeValue === "kg" && resultTypeValue==="inch"){
        alert('Không đổi Kilogram sang Inch được!')
	}else if(inputTypeValue === "kg" && resultTypeValue==="km"){
		alert('Không đổi  Kilogram sang Kilomet được!')
	}
	
}



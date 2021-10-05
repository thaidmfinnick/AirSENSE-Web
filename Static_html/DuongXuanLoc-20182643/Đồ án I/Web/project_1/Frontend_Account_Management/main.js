var listAccount = [];
var listDepartment = [];
var listPosition = [];


$(function () {

  // Gọi hàm load dữ liệu cho bảng Account từ sever API khi tải trang
  getListEmployees();
  // Gọi hàm load dữ liệu cho bảng Department từ sever API khi tải trang
  getListDepartment();
  // Gọi hàm load dữ liệu cho bảng Position từ sever API khi tải trang
  getListPosition();
  
  // Disabled 2 trường CreateDate và Id khi nhấn nút Save do 2 trường này tự cập nhật trong Db
  $("Cretate_Date_ID").attr("disabled", "disabled");
  $("#name_id").attr("disabled", "disabled");


  // Xử lý sự kiện cho nút reset đơn giản bằng Jquery
  $("#reset_btn").click(function () {
    $("#name_id").val("");
    $("#email").val("");
    $("#username").val("");
    $("#fullname").val("");
    $("#department_id").val("Chọn phòng ban đi");
    $("#position_id").val("Muốn làm gì");
  });

  // Xử lý sự kiện khi nhấn nút submit (Save)
  $("#Main_Form_ID").submit(function () {
    var v_id = $("#name_id").val();
    var v_email = $("#email").val();
    var v_username = $("#username").val();
    var v_fullname = $("#fullname").val();
    var v_department_name = $("#department_id").val();
    var v_position_name = $("#position_id").val();


    // Lấy ra ID của Department khi lựa chọn phòng ban
    for (let index = 0; index < listDepartment.length; index++) {
      if (listDepartment[index].name == v_department_name) {
        var depID = listDepartment[index].id;
      }
    }

    // Lấy ra ID của Position khi lựa chọn chức vụ
    for (let index = 0; index < listPosition.length; index++) {
      if (listPosition[index].name == v_position_name) {
        var posID = listPosition[index].id;
      }
    }
    
    // Tạo 1 đối tượng account để lưu trữ thông tin nhận được
    var account = {
      'email': v_email,
      'username': v_username,
      'fullName': v_fullname,
      'departmentId': depID,
      'positionId': posID,
    };

    $.post(
      "http://localhost:8086/api/v1/accounts/",
      account,
      function (data, status) {
        // error
        if (status == "error") {
          alert("Error when loading data");
          return;
        }
        // success
        // Hàm này để hiển thị thông tin account ở table
      
        getListEmployees();
      }
    );
    return false;
    // Sử dụng return false để không redirect tới 1 trang khác.
  });
});

function getListDepartment() {
  $.get("http://localhost:8086/api/v1/departments", function (data, status) {
    // reset list employees
    listDepartment = [];

    // error
    if (status == "error") {
      alert("Error when loading data");
      return;
    }
    // ok thì sẽ đổ dữ liệu vào list department đó , phải để đoạn code dưới đây trong ajax
    data.forEach(function (item) {
      var department = {
        id: item.id,
        name: item.name,
      };
      listDepartment.push(department);
    });
    // append

    for (let index = 0; index < listDepartment.length; index++) {
      $("#department_id").append(
        `<option>${listDepartment[index].name}</option>`
      );
    }
  });
}

function getListPosition() {
  $.get("http://localhost:8086/api/v1/positions", function (data, status) {
    listPosition = [];
    // error
    if (status == "error") {
      alert("Error when loading data");
      return;
    }

    data.forEach(function (item) {
      var position = {
        id: item.id,
        name: item.name,
      };
      listPosition.push(position);
    });

    // append

    for (let index = 0; index < listPosition.length; index++) {
      $("#position_id").append(`<option>${listPosition[index].name}</option>`);
    }
  });
  // ok
}

function showAccount() {
  $("#email").removeAttr("disabled");
  $("#username").removeAttr("disabled");

  // Xóa hết kết quả đang hiển thị ở bảng kết quả
  $("#Result_TB").empty();
  // Lặp trong ListAccount để in thông tin từng phần tử
  // Hiển thị thêm 2 nút để sửa xóa các Account
  for (let index = 0; index < listAccount.length; index++) {
    $("#Result_TB").append(`
   
   <tr>
      <th>${listAccount[index].AccountID}</th>
      <th>${listAccount[index].Email}</th>
      <th>${listAccount[index].Username}</th>
      <th>${listAccount[index].FullName}</th>
      <th>${listAccount[index].DepartmentID}</th>
      <th>${listAccount[index].PositionID}</th>
      <th>${listAccount[index].CreateDate}</th>
      <th><button class="btn btn-warning" onclick="editAccount(${index})">Edit</button></th>
      <th><button class="btn btn-warning" onclick="deleteAccount(${index})">Delete</button></th>
    </tr>
   
   `);
  }
}

// Xóa account theo index
function deleteAccount(Index) {
  var v_id = listAccount[Index].AccountID;

  var isConfirm = confirm("Bạn có chắc là muốn xóa ?");
  if (isConfirm) {
    $.ajax({
      url: "http://localhost:8086/api/v1/accounts/" + v_id,
      type: "DELETE",
      success: function (result) {
        if (result == undefined || result == null) {
          alert("Error delete");
          return;
        }
        getListEmployees();
      },
    });
    // showAccount();
  } else {
    return;
  }
}

// chỉnh sửa thông tin theo index -- update
function editAccount(Index) {
  // Đổ ngược data từ table lên form
  $("#name_id").val(listAccount[Index].AccountID);
  // $("#email").val(listAccount[Index].Email);
  // $("#Username").val(listAccount[Index].Username);
  $("#fullname").val(listAccount[Index].FullName);
  $("#department_id").val(listAccount[Index].DepartmentID);
  $("#position_id").val(listAccount[Index].PositionID);
  // $("#Cretate_Date_ID").val(listAccount[Index].CreateDate);

  // disabled các trường không cho update
  $("#email").attr("disabled", "disabled");
  $("#username").attr("disabled", "disabled");
  $("#Cretate_Date_ID").attr("disabled", "disabled");

  

  $("#update_btn").click(function () {
    var v_id = $("#name_id").val();
    var v_email = $("#email").val();
    var v_Username = $("#username").val();
    var v_fullname = $("#fullname").val();
    var v_department_id = $("#department_id").val();
    var v_position_id = $("#position_id").val();
    // var v_create_date_id = $("#Cretate_Date_ID").val();

    // listAccount[Index].AccountID = v_id
    // listAccount[Index].Email = v_email
    // listAccount[Index].Username = v_Username
    // listAccount[Index].Fullname = v_fullname
    // listAccount[Index].Department = v_department_id
    // listAccount[Index].Position = v_position_id
    // listAccount[Index].CreateDate= v_create_date_id

    for (let index = 0; index < listDepartment.length; index++) {
      if (listDepartment[index].name == v_department_id) {
        var depID = listDepartment[index].id;
      }
    }

    for (let index = 0; index < listPosition.length; index++) {
      if (listPosition[index].name == v_position_id) {
        var posID = listPosition[index].id;
      }
    }

    var account = {
      'fullName': v_fullname,
      'departmentId': depID,
      'positionId': posID,
    };
    console.log(account);
    $.ajax({
      url: "http://localhost:8086/api/v1/accounts/" + v_id,
      type: "PUT",
      data: account,
      success: function (result) {
        if (result == undefined || result == null) {
          alert("Error update");
          return;
        }
        getListEmployees();
      },
    });
    // showAccount();
  });
}

function getListEmployees() {

  var url = "http://localhost:8086/api/v1/accounts"
   // Call API từ Sever
  $.get(url, function (data, status) {
    // reset list employees
    listAccount = [];

    if (status == "error") {
      alert("Error");
      return;
    }
    
    //success
    parseData(data);
    showAccount();
  });
}
// hàm chuyển dữ liệu API nhận được bằng Ajax chuyển về dạng List để sử dụng trong chương trình
function parseData(data) {
  // employees = data;
  data.forEach(function (item) {
    var account = {
      AccountID: item.id,
      Email: item.email,
      Username: item.username,
      FullName: item.fullName,
      DepartmentID: item.department,
      PositionID: item.position,
      CreateDate: item.createDate,
    };
    console.log(account);
    listAccount.push(account);
  });
}


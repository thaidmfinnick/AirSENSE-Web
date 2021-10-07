

function gotoCheckUserStorage() {
    var userData = localStorage.getItem("username_AIRSENSE");
    console.log('pbtg');
    if (userData) {
        $("#managerAuthen").attr("href", "profile");
        $("#managerAuthen").html(userData);
        $("#managerLogout").attr("href", "logout");
        $("#managerLogout").html("Đăng xuất");
    }
    else {
        $("#managerAuthen").attr("href", "api/auth/login");
        $("#managerAuthen").html('Đăng nhập');
        $("#managerLogout").attr("href", "logout");
        $("#managerLogout").html("");
    }
}
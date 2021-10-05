import 'package:flutter/material.dart';
import 'package:iot/config/SettingInfo.dart';
import 'package:iot/screens/authen/register.dart';
import 'package:iot/screens/authen/verifynumber.dart';
import 'package:iot/utils/progressdialog.dart';
import 'package:iot/widgets/edittext.dart';
import 'package:iot/widgets/submitbutton.dart';
import 'package:iot/utils/local_stogate.dart';
import 'package:iot/screens/iot_device/device/control_rc_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'sign_in_google.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProgressDialog progressDialog;
  LocalStogate saveData= new LocalStogate();

  TextEditingController myControlTextUser= TextEditingController();
  TextEditingController myControlTextPass= TextEditingController();

  Future<void> checkLoginAsyn(BuildContext context) async {
    bool dataTologin = false;// await SettingInfo().GetUserInfor().checkUserInval();
    /*if(dataTologin){
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    }*/
  }
  // keytool -list -v \-alias androiddebugkey -keystore ~/.android/debug.keystore

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    SettingInfo().GetUserInfor().email="sapmle";
    SettingInfo().GetUserInfor().username="sapmle";
    SettingInfo().GetUserInfor().phone="sapmle";
    SettingInfo().GetUserInfor().manifest="sapmle";
    SettingInfo().GetUserInfor().tockenAcess="sapmle";
    SettingInfo().GetUserInfor().icon="sapmle";
    checkLoginAsyn(context);
    progressDialog.setMessage('Logging in...');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text("Đăng nhập", style: Theme.of(context).textTheme.title),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Xin chào hệ thống quản lý tin nhắn",
                      style: Theme.of(context).textTheme.subtitle),
                ),
                EditText(title: "Email" ,controlValue:myControlTextUser),
                EditText(title: "Password",controlValue:myControlTextPass),
                SubmitButton(
                  title: "Đăng nhập",
                  act: () async {
                    progressDialog.show();
                    Map<String, String> dataLogin= {
                    "email": myControlTextUser.text,
                    "password": myControlTextPass.text
                    };
                    bool dataTologin = await SettingInfo().GetUserInfor().checkUserInvalLogin(dataLogin);
                    if(dataTologin){
                        progressDialog.hide();
                        Future.delayed(Duration.zero, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        });

                        return;
                    }
                    progressDialog.hide();
                    MessageBox mMessageBox=new MessageBox(context, "Đăng nhập thất bại", "Thông báo");
                    mMessageBox.show();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("Quên mật khẩu?"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bạn chưa có tài khoản đăng ký ?  ",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "ĐĂng nhập google?  ",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    GestureDetector(
                      onTap: () async {
                       await signInWithGoogle().then((result) async {
                          if (result != null){
                            bool value = await SettingInfo().GetUserInfor().checkUserMqtt();
                            if(value){
                              Future.delayed(Duration.zero, () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              });
                            }
                          }
                        });
                      },
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:iot/screens/authen/login.dart';
import 'package:iot/screens/authen/verifynumber.dart';
import 'package:iot/widgets/edittext.dart';
import 'package:iot/widgets/submitbutton.dart';
import 'package:iot/config/SettingInfo.dart';
import 'package:iot/screens/home.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController nameText  = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passText  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    "Register account",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                EditText(title: "Name" ,controlValue:nameText),
                EditText(title: "Email" ,controlValue:emailText),
                EditText(title: "Password" ,controlValue:passText),
                SubmitButton(
                  title: "Register",
                  act: () async {
                    Map<String, String> dataRegister= {
                      "name": nameText.text,
                      "email": emailText.text,
                      "password": passText.text
                    };
                    bool check=  await  SettingInfo().GetUserInfor().registerToUser(dataRegister);
                    if(check){
                      Future.delayed(Duration.zero, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already exist account? ",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

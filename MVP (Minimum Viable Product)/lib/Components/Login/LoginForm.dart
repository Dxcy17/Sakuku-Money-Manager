import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/custom_surfix_icon.dart';
import 'package:flutter_application_1/Components/default_button_custome_color.dart';
import 'package:flutter_application_1/Screens/Home/homepage.dart';
import 'package:flutter_application_1/Screens/Register/RegistrasiScreen.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/utils/constants.dart';

class SignInform extends StatefulWidget {
  @override
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;

  TextEditingController txtUserName = TextEditingController(),
                        txtPassword = TextEditingController();

  FocusNode focusNode=new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(value: remember, 
              onChanged: (value) {
                setState(() {
                  remember = value;
                });
              }),
              Text("Remember Me"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text("Forget Password",
                style: TextStyle(decoration: TextDecoration.underline)
                ),
              ),
            ],
          ),
          DefaultButtonCustomeColor(
            color: kSecondaryColor,
            text: "LOGIN",
            press: (){

              if(_formkey.currentState!.validate()){
              }
            },
          ),
          SizedBox(height: 20,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RegistrasiScreen.routeName);
            },
            child: Text(
              "Belum Punya Akun? Daftar Disini",
            style: TextStyle(decoration: TextDecoration.underline),
            ),
            ),
            SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Homepage.routeName); // Fix the typo here
              },
                child: Text(
               "Login as Guest",
                 style: TextStyle(color: Colors.white),
               ),
              ),
          ],
        )
      );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUserName,
      keyboardType: TextInputType.emailAddress,
      style: mTitleStyle,
      decoration: InputDecoration(
        hintText: 'Masukan email anda',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons",
            )),
      );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        hintText: 'Masukan password anda',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons",
            )),
      );
  }
}

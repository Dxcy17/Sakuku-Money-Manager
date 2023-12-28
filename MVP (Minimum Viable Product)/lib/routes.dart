import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home/homepage.dart';
import 'package:flutter_application_1/Screens/Login/LoginScreens.dart';
import 'package:flutter_application_1/Screens/Register/RegistrasiScreen.dart';
import 'package:flutter_application_1/Screens/Home/homepage.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegistrasiScreen.routeName: (context) => RegistrasiScreen(),
  Homepage.routeName: (context) => Homepage(), // Fix the naming convention here
};

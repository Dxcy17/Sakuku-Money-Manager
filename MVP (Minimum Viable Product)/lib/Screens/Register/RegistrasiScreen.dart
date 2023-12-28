import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Register/RegistrasiComponent.dart'; // Import the RegisterComponent
import 'package:flutter_application_1/size_config.dart';

class RegistrasiScreen extends StatelessWidget {
  static String routeName = "/registrasi"; // Use the desired route name

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RegisterComponent(), // Use the RegisterComponent here
    );
  }
}

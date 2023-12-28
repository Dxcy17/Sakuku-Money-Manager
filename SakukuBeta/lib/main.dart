import 'package:flutter/material.dart';
import 'package:myapp/page/help.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/logo_sakuku.png', // Ganti dengan path logo aplikasi
                height: 250.0, // Ukuran logo yang lebih besar
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue, // Warna biru
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none, // Menghapus garis tepi
                    ),
                    filled: true,
                    fillColor: Colors.grey[300], // Warna abu-abu
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue, // Warna biru
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none, // Menghapus garis tepi
                    ),
                    filled: true,
                    fillColor: Colors.grey[300], // Warna abu-abu
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Checkbox(
                    value: false, // Atur nilai berdasarkan status 'remember me'
                    onChanged: (value) {
                      // Implement remember me functionality
                    },
                  ),
                  Text('Remember Me'),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Implement forgot password functionality
                    },
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement guest login functionality
                  print('Guest button pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()), // Ganti dengan halaman baru yang ingin diarahkan
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize: Size(double.infinity, 40.0), // Panjang tombol
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Implement guest login functionality
                  print('Guest button pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()), // Ganti dengan halaman baru yang ingin diarahkan
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize: Size(double.infinity, 40.0), // Panjang tombol
                ),
                child: Text('Guest'),
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      // Implement create account functionality
                    },
                    child: Text('Create Account'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

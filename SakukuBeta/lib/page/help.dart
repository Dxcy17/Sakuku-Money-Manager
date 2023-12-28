import 'package:flutter/material.dart';
import 'package:myapp/page/profile.dart';
import 'package:myapp/page/search.dart';
import 'package:myapp/page/setting.dart';
import 'package:myapp/page/task.dart';

void main() {
  runApp(HelpPage());
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class NoteTakingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Taking Page'),
      ),
      body: Center(
        child: Text('This is the Note Taking page!'),
      ),
    );
  }
}


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/logo_help.png', // Ganti dengan path logo aplikasi
                height: 200.0, // Sesuaikan dengan kebutuhan
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: Size(200, 50), // Adjust the size as needed
                ),
                child: Text('Profile'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: Size(200, 50), // Adjust the size as needed
                ),
                child: Text('Mencatat'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: Size(200, 50), // Adjust the size as needed
                ),
                child: Text('Pencarian'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: Size(200, 50), // Adjust the size as needed
                ),
                child: Text('Pengaturan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

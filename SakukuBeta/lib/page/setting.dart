import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Pengaturan',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 32.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement logic untuk keluar dari aplikasi
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
              ),
              child: Text('Keluar dari Aplikasi'),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double saldo = 1000.0;
  double totalPemasukan = 0.0;
  double totalPengeluaran = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ... bagian sebelumnya tetap sama

            SizedBox(height: 16.0),

            // Centered Container Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic untuk button ini
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Text('Tambah Catatan Transaksi'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.blue), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.blue), label: 'Pencarian'),
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.blue), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment, color: Colors.blue), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.blue), label: 'Pengaturan'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

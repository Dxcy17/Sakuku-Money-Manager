import 'package:flutter/material.dart';
import 'home.dart'; // Import file home.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              // Navigasi ke halaman pengaturan
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Box Kontrainer Foto Profil, Nama, dan Ikon Pengaturan
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
                color: Colors.blueAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Foto Profil yang sudah ditetapkan dari asset
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logo_user.png'),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama
                          Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Email
                          Text(
                            'admin@example.com',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    // Ikon Pengaturan
                    IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      onPressed: () async {
                        // Navigasi ke halaman pengaturan
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Box Kontrainer Tanggal Lahir
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Lahir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Tambahkan widget calendar di sini
                    TextFormField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          // Update value of TextFormField
                          String formattedDate =
                              "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                          // Set nilai pada text controller
                          _birthdateController.text = formattedDate;
                        }
                      },
                      controller: _birthdateController,
                      decoration: InputDecoration(
                        hintText: 'Pilih Tanggal',
                        fillColor: Colors.blue[100],
                        filled: true,
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Box Kontrainer Sebagai
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sebagai',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Tambahkan TextField untuk Sebagai di sini
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan peran atau jabatan',
                        fillColor: Colors.blue[100],
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Box Kontrainer Email
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Tambahkan TextField untuk Email di sini
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan email',
                        fillColor: Colors.blue[100],
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32), // Memberi ruang ekstra di bawah box kontrainer
            // Tombol Simpan
            Container(
              width: double.infinity, // Membuat tombol lebar penuh
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika penyimpanan data di sini
                  // Misalnya, dapat menggunakan penyimpanan lokal atau API

                  // Navigasi ke halaman utama (home.dart)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Simpan', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Center(
        child: Text(
          'Halaman Pengaturan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Buat controller untuk TextFormField Tanggal Lahir
final TextEditingController _birthdateController = TextEditingController();

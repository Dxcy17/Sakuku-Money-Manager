import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double saldo = 0.0;
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
            // Profile Box Container
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue, // Mengganti warna kontrainer box menjadi biru
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/logo_user.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Admin', // Ganti dengan nama admin yang sesuai
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Mengganti warna teks menjadi putih
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Total Saldo: \$${saldo.toStringAsFixed(2)}', // Ganti dengan saldo aktual
                    style: TextStyle(fontSize: 16.0, color: Colors.white), // Mengganti warna teks menjadi putih
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Pemasukan
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.greenAccent.withOpacity(0.5), // Transparan warna background pemasukan
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_upward, color: Colors.green),
                              SizedBox(width: 3.5),
                              Text('INT: \500', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      // Pengeluaran
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.pinkAccent.withOpacity(0.5), // Transparan warna background pengeluaran
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.pink),
                              SizedBox(width: 3.5),
                              Text('OUT: \200', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.0),

            // Riwayat Pencatatan Transaksi (To-Do List Style)
            Text(
              'Riwayat Pencatatan Transaksi',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8.0),

            // Contoh Item Pencatatan
            buildTransactionItem(context, 'Pemasukan', 'Gaji', 500.0, Colors.greenAccent),
            buildTransactionItem(context, 'Pengeluaran', 'Belanja Bulanan', 200.0, Colors.pinkAccent),

            SizedBox(height: 16.0),

            // Container Button
            ElevatedButton(
              onPressed: () {
                // Implement logic untuk button ini
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: Text('Tambah Catatan Transaksi'),
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

  Widget buildTransactionItem(
      BuildContext context, String type, String description, double amount, Color itemColor) {
    // Update saldo berdasarkan jenis transaksi
    if (type == 'Pemasukan') {
      saldo += amount;
      totalPemasukan += amount;
    } else if (type == 'Pengeluaran') {
      saldo -= amount;
      totalPengeluaran += amount;
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
        color: itemColor, // Mengganti warna background berdasarkan kategori
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(description),
            ],
          ),
          Text('\$${amount.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  String jenis;
  double jumlah;
  DateTime tanggal;
  String catatan;

  Transaction({
    required this.jenis,
    required this.jumlah,
    required this.tanggal,
    required this.catatan,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencatat Keuangan',
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TaskPage> {
  TextEditingController jenisController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pencatat Keuangan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jenis Keuangan:'),
            TextField(controller: jenisController),
            SizedBox(height: 16.0),
            Text('Jumlah Keuangan:'),
            TextField(controller: jumlahController),
            SizedBox(height: 16.0),
            Text('Tanggal:'),
            TextField(controller: tanggalController),
            SizedBox(height: 16.0),
            Text('Catatan Keuangan:'),
            TextField(controller: catatanController),
            SizedBox(height: 32.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveTransaction();
                  },
                  child: Text('Catat'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    navigateToHistory();
                  },
                  child: Text('Riwayat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveTransaction() {
    String jenis = jenisController.text;
    double jumlah = double.tryParse(jumlahController.text) ?? 0.0;
    DateTime tanggal = DateTime.parse(tanggalController.text);
    String catatan = catatanController.text;

    Transaction transaction = Transaction(
      jenis: jenis,
      jumlah: jumlah,
      tanggal: tanggal,
      catatan: catatan,
    );

    transactions.add(transaction);

    // Clear input fields after saving
    jenisController.clear();
    jumlahController.clear();
    tanggalController.clear();
    catatanController.clear();

    // You can print the transactions list to see the saved data
    print('Saved Transactions:');
    transactions.forEach((transaction) {
      print('Jenis: ${transaction.jenis}, Jumlah: ${transaction.jumlah}, Tanggal: ${transaction.tanggal}, Catatan: ${transaction.catatan}');
    });
  }

  void navigateToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransactionHistoryPage(transactions: transactions),
      ),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionHistoryPage({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Keuangan'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          Transaction transaction = transactions[index];
          return ListTile(
            title: Text('Jenis: ${transaction.jenis}'),
            subtitle: Text('Jumlah: ${transaction.jumlah}, Tanggal: ${transaction.tanggal}, Catatan: ${transaction.catatan}'),
          );
        },
      ),
    );
  }
}

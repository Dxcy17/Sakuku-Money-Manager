// search_page.dart
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Transaction> transactions = [
    Transaction(type: TransactionType.income, amount: 500, details: "Gaji"),
    Transaction(type: TransactionType.expense, amount: 50, details: "Makan Siang"),
    // Tambahkan transaksi lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Keuangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Box Pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari transaksi...',
              ),
            ),
            SizedBox(height: 10),
            // Text Pencarian
            Text(
              'Hasil Pencarian: ${_searchController.text}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Box Container Pemasukan/Pengeluaran
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.7), // Hijau transparan untuk pemasukan
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pemasukan',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total: \$${getTotal(TransactionType.income)}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // Rincian Pemasukan
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        if (transactions[index].type == TransactionType.income) {
                          return ListTile(
                            title: Text(
                              transactions[index].details,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '+\$${transactions[index].amount}',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Box Container Pemasukan/Pengeluaran
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.7), // Merah transparan untuk pengeluaran
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengeluaran',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total: \$${getTotal(TransactionType.expense)}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // Rincian Pengeluaran
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        if (transactions[index].type == TransactionType.expense) {
                          return ListTile(
                            title: Text(
                              transactions[index].details,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '-\$${transactions[index].amount}',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getTotal(TransactionType type) {
    double total = 0;
    for (var transaction in transactions) {
      if (transaction.type == type) {
        total += transaction.amount;
      }
    }
    return total;
  }
}

enum TransactionType {
  income,
  expense,
}

class Transaction {
  final TransactionType type;
  final double amount;
  final String details;

  Transaction({required this.type, required this.amount, required this.details});
}

import 'package:flutter/material.dart';
import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Screens/BottomNavigation/BottomNavigation.dart';
import 'package:http/http.dart' as http;

class Pembayaran extends StatefulWidget {
  @override
  _PembayaranState createState() => _PembayaranState();
}

Future<void> postData() async {
  var url = Uri.parse('http://localhost:8000/truncate-table');
  var response = await http.post(Uri.parse(hapuspesananURL));

  if (response.statusCode == 200) {
    print('Data dalam tabel berhasil dihapus');
  } else {
    print('Gagal menghapus data dalam tabel');
  }
}

class _PembayaranState extends State<Pembayaran> {
  String selectedMethod = '';

  void navigateToPaymentMethod(String methodName) {
    setState(() {
      selectedMethod = methodName;
      postData();
    });
  }

  void confirmPayment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembayaran'),
          content: Text('Metode pembayaran: $selectedMethod'),
          actions: [
            ElevatedButton(
              onPressed: () {
                postData();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()),
                );
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih metode pembayaran:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                navigateToPaymentMethod('Kartu Kredit');
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: selectedMethod == 'Kartu Kredit'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(width: 16.0),
                    Text(
                      'Kartu Kredit',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                navigateToPaymentMethod('Dompet Digital');
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: selectedMethod == 'Dompet Digital'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    SizedBox(width: 16.0),
                    Text(
                      'Dompet Digital',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                navigateToPaymentMethod('Transfer Bank');
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: selectedMethod == 'Transfer Bank'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.payment),
                    SizedBox(width: 16.0),
                    Text(
                      'Transfer Bank',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                navigateToPaymentMethod('Cash on Delivery');
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: selectedMethod == 'Cash on Delivery'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.money),
                    SizedBox(width: 16.0),
                    Text(
                      'Cash on Delivery',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                navigateToPaymentMethod('Virtual Account');
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: selectedMethod == 'Virtual Account'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance),
                    SizedBox(width: 16.0),
                    Text(
                      'Virtual Account',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: selectedMethod.isNotEmpty ? confirmPayment : null,
              child: Text('Konfirmasi'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Pembayaran(),
  ));
}

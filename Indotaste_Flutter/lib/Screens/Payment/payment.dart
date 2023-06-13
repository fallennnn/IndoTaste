import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [Icon(Icons.shopping_basket_rounded)],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/dine_in.jpg',
                        height: 50,
                      ),
                      Text('Dine in'),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/kucing.jpeg',
                        height: 50,
                      ),
                      Text('Pick up'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 400,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Detail Pesanan'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/'),
                            backgroundColor: Colors.grey,
                            radius: 30.0,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Big Burger"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rp 44.000",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Text("4 pcs"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/'),
                            backgroundColor: Colors.grey,
                            radius: 30.0,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Big Burger Extra Combo",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rp 80.000",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Text("4 pcs"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  color: Colors.white,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Pilih Metode Pembayaran",
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Checkout",
                              style: TextStyle(fontSize: 18.0),
                            )),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(30),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text("Total Pembayaran : "), Text("Rp 0,00")],
          ),
        ),
      ),
    );
  }
}

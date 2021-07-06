//external
import 'package:flutter/material.dart';
//internal
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal[200],
      ),
      title: 'Neumorphic App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('t1', 'New Bag', 300.0, DateTime.now()),
    Transaction('t2', 'New Mouse', 650.0, DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                  child:
                      Container(width: double.infinity, child: Text('chart'))),
              Column(
                children: transactions.map((t) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white10, width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 6,
                      margin: new EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.teal[50],
                                      borderRadius: BorderRadius.circular(40)),
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Image(
                                    image: Image.asset('images/shop.png').image,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      t.title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DateFormat.yMMMMd("en_US").format(t.date),
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 18),
                                child: Text(
                                  t.amount.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.teal),
                                )),
                          ]));
                }).toList(),
              )
            ],
          ),
        ));
  }
}

//internal
import '../models/transaction.dart';
//external
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction('t1', 'New Bag', 300.0, DateTime.now()),
    Transaction('t2', 'New Mouse', 650.0, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((t) {
        return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white10, width: 0),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 6,
            margin: new EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        margin: EdgeInsets.fromLTRB(10, 12, 15, 12),
                        child: Image(
                          image: Image.asset('images/shop.png').image,
                          width: 26,
                          height: 26,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            t.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                      child: Text(
                        t.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.teal),
                      )),
                ]));
      }).toList(),
    );
  }
}

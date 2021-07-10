//internal
import '../models/transaction.dart';
//external
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 250,
                  child: Image(
                    image: Image.asset('images/empty.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'No Transfers added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Neumorphic(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 5,
                        lightSource: LightSource.topRight,
                        intensity: .8,
                        color: Colors.white38),
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
                                  Text(transactions[index].title,
                                      style: Theme.of(context).textTheme.title),
                                  Text(
                                    DateFormat.yMMMMd("en_US")
                                        .format(transactions[index].date),
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                          FittedBox(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 18),
                                child: Text(
                                  transactions[index].amount.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.teal),
                                )),
                          ),
                        ]));
              },
              itemCount: transactions.length,
            ),
    );
  }
}

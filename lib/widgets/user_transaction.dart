//external
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
//internal
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction('t1', 'New Bag', 300.0, DateTime.now()),
    Transaction('t2', 'New Mouse', 650.0, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(), TransactionList(_transactions)],
    );
  }
}

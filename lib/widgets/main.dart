//external
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//internal
import './transaction_list.dart';

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
  final titleController = TextEditingController();
  final ammountController = TextEditingController();

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
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: ammountController,
                      ),
                      FlatButton(
                          textColor: Colors.teal,
                          onPressed: () {
                            print(titleController.text);
                            print(ammountController.text);
                          },
                          child: Text('Add Transaction'))
                    ],
                  ),
                ),
              ),
              TransactionList()
            ],
          ),
        ));
  }
}

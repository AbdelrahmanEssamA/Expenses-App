//external
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_expenses/widgets/new_transaction.dart';
//internal
import 'widgets/user_transaction.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                  child:
                      Container(width: double.infinity, child: Text('chart'))),
              UserTransaction(),
            ],
          ),
        ));
  }
}

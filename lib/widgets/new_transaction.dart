import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final ammountController = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(ammountController.text) <= 0) {
      return;
    }
    widget.addTx(titleController.text, double.parse(ammountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: 'Title',
                labelStyle: new TextStyle(color: Colors.teal),
              ),
              controller: titleController,
              onSubmitted: (_) => submitData,
              cursorColor: Colors.teal,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: 'Amount',
                labelStyle: new TextStyle(color: Colors.teal),
              ),
              cursorColor: Colors.teal,
              controller: ammountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
                textColor: Colors.teal,
                onPressed: submitData,
                child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}

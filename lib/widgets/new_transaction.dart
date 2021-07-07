import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  NewTransaction(this.addTx);
  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(ammountController.text) <= 0) {
      return;
    }
    addTx(titleController.text, double.parse(ammountController.text));
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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
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

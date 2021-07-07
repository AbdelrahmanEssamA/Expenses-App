import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final ammountController = TextEditingController();

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
    );
  }
}

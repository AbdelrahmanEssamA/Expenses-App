import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final ammountController = TextEditingController();

  DateTime? _selectedDate;

  void _submitData() {
    if (titleController.text.isEmpty ||
        double.parse(ammountController.text) <= 0 ||
        _selectedDate == null) {
      return;
    }
    widget.addTx(titleController.text, double.parse(ammountController.text),
        _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('taztoz elbaby');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: 'Title',
                labelStyle: new TextStyle(color: Colors.teal),
              ),
              controller: titleController,
              onSubmitted: (_) => _submitData,
              cursorColor: Colors.teal,
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: 'Amount',
                labelStyle: new TextStyle(color: Colors.teal),
              ),
              cursorColor: Colors.teal,
              controller: ammountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosem!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate as DateTime)}'),
                  ),
                  FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    textColor: Theme.of(context).accentColor,
                  )
                ],
              ),
            ),
            RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: _submitData,
                child: Text('Add Transaction')),
          ],
        ),
      ),
    );
  }
}

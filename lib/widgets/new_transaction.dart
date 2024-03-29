import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtransation;
  NewTransaction({this.addtransation});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addData() {
    final enteredTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enterdAmount <= 0) {
      return;
    }
    widget.addtransation(enteredTitle, enterdAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              keyboardType: TextInputType.text,
              // onChanged: (val){
              //titleImput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addData(),
              // onChanged: (val)
              // =>  amountInput = val
              // ,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
                addData();
                //addtransation(titleController.text, double.parse( amountController.text));
                //print(titleImput);
                //print(amountInput);
              },
            )
          ],
        ),
      ),
    );
  }
}

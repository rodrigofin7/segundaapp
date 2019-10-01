import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController(); 
  final amountController = TextEditingController(); 
  final Function addtransation;

  NewTransaction({this.addtransation});

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
                         // onChanged: (val){
                          //titleImput = val;
                        //},
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        // onChanged: (val)  
                        // =>  amountInput = val
                        // ,
                      ),
                      FlatButton(
                        child: Text('Add Transaction'),
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text); 
                          addtransation(titleController.text, double.parse( amountController.text));
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
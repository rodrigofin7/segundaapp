import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', tile: 'Nike', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', tile: 'Adidas', amount: 70.50, date: DateTime.now()),
    Transaction(id: 't3', tile: 'Fila', amount: 48.00, date: DateTime.now()),
    Transaction(id: 't4', tile: 'Panam', amount: 35.00, date: DateTime.now()),
    Transaction(id: 't5', tile: 'Convers', amount: 42.99, date: DateTime.now()),
    Transaction(id: 't6', tile: 'Puma', amount: 65.00, date: DateTime.now()),
  ];

  // String titleImput; 
  // String amountInput; 

  final titleController = TextEditingController(); 
  final amountController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo '),
        ),
        body: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART'),
                  elevation: 5,
                ),
              ),
              Card(
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
                          //print(titleImput);
                          //print(amountInput);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions.map((tran) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tran.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tran.tile,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(tran.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ));
                }).toList(),
              )
            ]));
  }
}

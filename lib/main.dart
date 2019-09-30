import 'package:flutter/material.dart';
import './Transaction.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo '),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          tran.amount.toString(),
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
                          Text(tran.date.toString(),style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ));
                }).toList(),
              )
            ]));
  }
}

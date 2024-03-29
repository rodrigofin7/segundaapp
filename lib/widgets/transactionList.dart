import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // final List<Transaction> _userTransaction = [
  //   Transaction(id: 't1', tile: 'Nike', amount: 69.99, date: DateTime.now()),
  //   Transaction(id: 't2', tile: 'Adidas', amount: 70.50, date: DateTime.now()),
  //   Transaction(id: 't3', tile: 'Fila', amount: 48.00, date: DateTime.now()),
  //   Transaction(id: 't4', tile: 'Panam', amount: 35.00, date: DateTime.now()),
  //   Transaction(id: 't5', tile: 'Convers', amount: 42.99, date: DateTime.now()),
  //   Transaction(id: 't6', tile: 'Puma', amount: 65.00, date: DateTime.now()),
  // ];

  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor , width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[index].tile,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(transactions[index].date),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ],
              )
            ],
          ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transactionList.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', tile: 'Nike', amount: 69.99, date: DateTime.now()),
    // Transaction(id: 't2', tile: 'Adidas', amount: 70.50, date: DateTime.now()),
    // Transaction(id: 't3', tile: 'Fila', amount: 48.00, date: DateTime.now()),
    // Transaction(id: 't4', tile: 'Panam', amount: 35.00, date: DateTime.now()),
    // Transaction(id: 't5', tile: 'Convers', amount: 42.99, date: DateTime.now()),
    // Transaction(id: 't6', tile: 'Puma', amount: 65.00, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        tile: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
       
        setState(() {
          _userTransaction.add(newTx);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(  addtransation:_addNewTransaction, ),
        TransactionList(
          transactions: _userTransaction,
        )
      ],
    );
  }
}

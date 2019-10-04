import 'package:flutter/material.dart';
import './widgets/transactionList.dart';
import './widgets/new_transaction.dart';
import 'models/Transaction.dart';

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

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', tile: 'Nike', amount: 69.99, date: DateTime.now()),
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

  void _startAddNewTransaction(BuildContext ctx){
   showModalBottomSheet(context: ctx, builder: (_) {

       return GestureDetector(
         onTap: (){},
         child: NewTransaction(addtransation: _addNewTransaction) ,
         behavior: HitTestBehavior.opaque ,
       );
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo '),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context) ,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
              TransactionList(transactions: _userTransaction)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context) ,
      ),
    );
  }
}

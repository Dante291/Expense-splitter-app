import 'package:expense_splitter/new_tx.dart';
import 'package:flutter/material.dart';

import 'Transaction_list.dart';
import 'transaction.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactions = [
    Transaction(
        id: 't1', title: 'NEW SHOES', amount: 82.90, date: DateTime.now()),
    Transaction(id: 't2', title: 'STUDIES', amount: 10.00, date: DateTime.now())
  ];
  void addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      userTransactions.add(newTx);
    });
  }

  void txSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransactions(addNewTransactions);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Splitter'),
        actions: [
          IconButton(
              onPressed: () {
                txSheet(context);
              },
              icon: const Icon(
                Icons.add_circle_outline,
                size: 35,
                color: Color.fromARGB(255, 168, 97, 181),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
                width: double.infinity,
                child: const Card(
                  color: Color.fromARGB(255, 236, 103, 149),
                  elevation: 10,
                  child: Text(
                    'CHART!',
                    textAlign: TextAlign.center,
                  ),
                )),
            TransactionList(userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 246, 240, 245),
        onPressed: () {
          txSheet(context);
        },
        child: const Icon(
          Icons.format_list_bulleted_add,
          size: 35,
          color: Color.fromARGB(255, 168, 97, 181),
        ),
      ),
    );
  }
}

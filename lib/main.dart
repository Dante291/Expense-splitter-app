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
      title: 'Expense Splitter',
      theme: ThemeData(primarySwatch: Colors.green),
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
    // Transaction(
    //     id: 't1', title: 'NEW SHOES', amount: 82.90, date: DateTime.now()),
    // Transaction(id: 't2', title: 'STUDIES', amount: 10.00, date: DateTime.now())
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
        // backgroundColor: Colors.green,
        title: const Text(
          'Expense Splitter',
        ),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
        actions: [
          IconButton(
              onPressed: () {
                txSheet(context);
              },
              icon: const Icon(
                Icons.playlist_add_rounded,
                size: 35,
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
                  color: Colors.green,
                  shadowColor: Color.fromARGB(255, 255, 78, 51),
                  elevation: 10,
                  child: Text('CHART!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                      )),
                )),
            const SizedBox(
              height: 10,
            ),
            TransactionList(userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txSheet(context);
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}

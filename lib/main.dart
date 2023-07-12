import 'chart.dart';
import 'new_tx.dart';
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
  final List<Transaction> userTransactions = [];

  List<Transaction> get recentTx {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void addNewTransactions(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate);

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

  void deleteTx(String id) {
    setState(() {
      userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
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
            Chart(recentTx),
            const SizedBox(
              height: 20,
            ),
            TransactionList(userTransactions, deleteTx),
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

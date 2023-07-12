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
      theme: ThemeData(primarySwatch: Colors.teal),
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
    var appbar = AppBar(
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
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) *
                  0.04,
              child: const Text('Past 7 days transactions',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.26,
                child: Chart(recentTx)),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.7,
                child: TransactionList(userTransactions, deleteTx)),
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

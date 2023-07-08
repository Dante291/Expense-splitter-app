import 'package:expense_splitter/user_tx.dart';
import 'package:flutter/material.dart';

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
class MyHomePage extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Splitter'),
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
              const UserTransactions()
            ],
          ),
        ));
  }
}

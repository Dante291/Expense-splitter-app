import 'package:flutter/material.dart';
import 'Transaction_list.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          title: const Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
                width: double.infinity,
                child: const Card(
                  color: Color.fromARGB(255, 247, 52, 121),
                  elevation: 5,
                  child: Text(
                    'CHART!',
                    textAlign: TextAlign.center,
                  ),
                )),
            Card(
              elevation: 5,
              color: const Color.fromARGB(255, 129, 87, 201),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'TITLE',
                      ),
                      controller: titlecontroller,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'AMOUNT'),
                      controller: amountcontroller,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titlecontroller.text);
                      },
                      child: const Text(
                        "Add Transaction",
                        style: TextStyle(
                            color: Color.fromARGB(255, 246, 100, 222)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            TransactionList()
          ],
        ));
  }
}

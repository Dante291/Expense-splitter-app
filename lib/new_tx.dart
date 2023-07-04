import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NewTransactions extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  // ignore: use_key_in_widget_constructors
  NewTransactions(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            TextButton(
              onPressed: () {
                addTx(
                  titlecontroller.text,
                  double.parse(amountcontroller.text),
                );
              },
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Color.fromARGB(255, 245, 55, 55)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

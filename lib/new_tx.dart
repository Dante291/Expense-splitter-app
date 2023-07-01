import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NewTransactions extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

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
            ),
            TextButton(
              onPressed: () {
                print(titlecontroller.text);
              },
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Color.fromARGB(255, 246, 100, 222)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

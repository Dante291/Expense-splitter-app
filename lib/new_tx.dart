import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NewTransactions extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  // ignore: use_key_in_widget_constructors
  NewTransactions(this.addTx);

  void sumbitdata() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }

    addTx(
      enteredtitle,
      enteredamount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 192, 157, 251),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(2),
                    labelText: 'TITLE',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 249, 208, 243))),
                controller: titlecontroller,
                onTapOutside: ((event) {
                  FocusScope.of(context).unfocus();
                }),
                onSubmitted: (_) => sumbitdata()),
            TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(2),
                  labelText: 'AMOUNT',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 249, 208, 243))),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => sumbitdata(),
              style: const TextStyle(fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton.tonal(
              onPressed: sumbitdata,
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Color.fromARGB(255, 202, 92, 151)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

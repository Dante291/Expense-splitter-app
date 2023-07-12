import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class NewTransactions extends StatefulWidget {
  final Function addTx;
  // ignore: use_key_in_widget_constructors
  const NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titlecontroller = TextEditingController();
  String selectedDate = '';
  final amountcontroller = TextEditingController();

  void sumbitdata() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0 || selectedDate == '') {
      return;
    }

    widget.addTx(
      enteredtitle,
      enteredamount,
      DateTime.parse(selectedDate),
    );

    Navigator.of(context).pop();
  }

  void datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    labelText: 'TITLE',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  controller: titlecontroller,
                  onTapOutside: ((event) {
                    FocusScope.of(context).unfocus();
                  }),
                  onSubmitted: (_) => sumbitdata()),
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  labelText: 'AMOUNT',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  )),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onTapOutside: ((event) {
                FocusScope.of(context).unfocus();
              }),
              onSubmitted: (_) => sumbitdata(),
              style: const TextStyle(
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    selectedDate == ''
                        ? 'NO DATE CHOSEN!'
                        : 'Picked Date: ${DateFormat.yMd().format(DateTime.parse(selectedDate)).toString()}',
                  )),
                  TextButton(
                      onPressed: datepicker,
                      child: const Text(
                        'CHOOSE DATE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            FilledButton.tonal(
              onPressed: sumbitdata,
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

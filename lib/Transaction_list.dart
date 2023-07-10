// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';

// ignore: use_key_in_widget_constructors
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 415,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const Text(
                  'No transactions added yet!',
                  style: TextStyle(fontSize: 23),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/minion.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '₹${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: const TextStyle(
                              // color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 131, 130, 130),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

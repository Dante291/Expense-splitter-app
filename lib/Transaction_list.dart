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
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 2),
                            color: Theme.of(context).primaryColor),
                        height: 70.0,
                        width: 85.0,
                        // color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                  '₹${transactions[index].amount.toString()}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> userTransactions = [
    Transaction(
        id: 't1', title: 'NEW SHOES', amount: 82.90, date: DateTime.now()),
    Transaction(id: 't2', title: 'studies', amount: 10.00, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color.fromARGB(255, 138, 97, 250),
                  width: 2,
                )),
                padding: const EdgeInsets.all(10),
                child: Text(
                  '\$${tx.amount}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.greenAccent),
                ),
              ),
              Column()
            ],
          ),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import './new_tx.dart';
import './Transaction_list.dart';
import './transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransactions = [
    Transaction(
        id: 't1', title: 'NEW SHOES', amount: 82.90, date: DateTime.now()),
    Transaction(id: 't2', title: 'STUDIES', amount: 10.00, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(),
        TransactionList(userTransactions),
      ],
    );
  }
}

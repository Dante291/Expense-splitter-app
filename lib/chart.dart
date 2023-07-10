import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTx;

  Chart(this.recentTx);

  List<Map<String, Object>> get groupedTxvalues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTx.length; i++) {
        if (recentTx[i].date.day == weekday.day &&
            recentTx[i].date.month == weekday.month &&
            recentTx[i].date.year == weekday.year) {
          totalSum += totalSum + recentTx[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTxvalues);
    return const Placeholder();
  }
}

import 'package:expense_splitter/chart_bar.dart';
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
        'day': DateFormat.E().format(weekday).substring(0, 3),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTxvalues.fold(0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTxvalues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: Chartbar(
                    data['day'].toString(),
                    (data['amount'] as double),
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spentpctoftotal;

  const Chartbar(this.label, this.spendingAmount, this.spentpctoftotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: <Widget>[
          SizedBox(
              height: constraint.maxHeight * 0.10,
              child: FittedBox(
                  child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraint.maxHeight * 0.7,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 190, 189, 189),
                      width: 1.5,
                    ),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spentpctoftotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          SizedBox(
              height: constraint.maxHeight * 0.10,
              child: FittedBox(child: Text(label))),
        ],
      );
    });
  }
}

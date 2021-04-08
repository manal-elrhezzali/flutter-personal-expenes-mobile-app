import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    // 0.0 is the initial value, sum is the previous value we calculated
    // based on this function and item is the current element we are
    // looking at of the list
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              //map takes a function that executes on each
              //groupedTransactionValues list items and returns a widget
              groupedTransactionValues.map((data) {
            // return Text(data["day"] + " : " + data["amount"].toString(),);
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data["day"],
                data["amount"],
                totalSpending == 0.0
                    ? 0.0
                    : (data["amount"] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

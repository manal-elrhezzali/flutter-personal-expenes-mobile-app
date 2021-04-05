import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatefulWidget {
  
  @override  
  _TransactionListState createState() => _TransactionListState();
}



class _TransactionListState extends State<TransactionList> {
  
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "New course",
      amount: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 40.54,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
      return  Column(
            //shows each element in the transaction list as a Card
            children: _userTransactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$${tx.amount}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          //DateFormat().format(tx.date),
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          );
  }
}
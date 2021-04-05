import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/widgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //String titleInput;
  //String amountInput;
  //
  //final titleController = TextEditingController();
  //final amountController = TextEditingController();

//  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("A CHART goes here!"),
                elevation: 5,
              ),
            ),
            UserTransactions(),
            //moved to UserTransactions to manage them there
            //NewTransaction(),
            //TransactionList(),
          ],
        ),
      ),
    );
  }
}

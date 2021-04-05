import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/widgets/transaction_list.dart';
import './models/transaction.dart';

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
  final titleController = TextEditingController();
  final amountController = TextEditingController();

//  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    //we can omit the type String cuz Dart will infer it

                    //instead of registering the input manually on each key stroke
                    //Flutter provides us with an alternative that allows us to listne to each key stroke and get the finished value once we're done
                    controller: titleController,

                    //onChanged: (String val) {
                    //  titleInput = val;
                    //},
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(labelText: "Amount"),
                    //onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    onPressed: () {
                      print(titleController.text);
                      //print(titleInput);
                      //print(amountInput);
                    },
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
          TransactionList(),
        ],
      ),
    );
  }
}

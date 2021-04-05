import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {

  final TextEditingController titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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

                      //TODO : we need to trigger the _addTransaction method 

                      //print(titleInput);
                      //print(amountInput);
                    },
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                  ),
                ],
              ),
            ),
          );
  }
}
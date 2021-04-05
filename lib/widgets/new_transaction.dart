import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  final TextEditingController titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredAmount <= 0 || enteredTitle.isEmpty ){
      return;
    }
    //calls the _addNewTransaction method
    addTx(
      titleController.text,
      double.parse(amountController.text),
    );
  }

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

              //instead of registering the input manually on each key stroke
              //Flutter provides us with an alternative that allows us to listne to each key stroke and get the finished value once we're done
              controller: titleController,
              //onChanged: (String val) {
              //  titleInput = val;
              //},
              onSubmitted: (_) => submitData(), // <=> onSubmitted: (String val) => submitData,

              
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
              //this controlls the keyboard that shows up when the user taps on the amount TextField
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //it's a convention to use underscore instead of a meaningful name
              //to indicate that we take a parameter but we won't use it
              onSubmitted: (_) => submitData(), // <=> onSubmitted: (String val) => submitData,

              
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  const AddTransaction({required this.addTransaction});
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Amount:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          TextField(
            //controller: dateItem,
            decoration: InputDecoration(
              labelText: 'Date Picker:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(alignment: Alignment.bottomRight),
            onPressed: () {
              print(amountController.text);
              print(titleController.text);
              widget.addTransaction(
                amount: amountController.text,
                title: titleController.text,
                id: 1,
                date: DateTime.now().toString(),
              );
              Navigator.pop(context);
            },
            child: Text('Save Transaction'),
          ),
        ],
      ),
    );
  }
}

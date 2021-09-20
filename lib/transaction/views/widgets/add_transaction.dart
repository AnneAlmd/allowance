import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatelessWidget {
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
              context.read<TransactionController>().addTransaction(
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

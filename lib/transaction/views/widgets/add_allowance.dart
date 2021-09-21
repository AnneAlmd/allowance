import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAllowance extends StatelessWidget {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.tag_faces_sharp),
                  Text(
                    'Hey, how much do you have today?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.money),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(
              //hintText: '100.0',
              labelText: '\$ amount:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColorLight,
              alignment: Alignment.center,
              elevation: 8,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shadowColor: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              context
                  .read<TransactionController>()
                  .allowanceAdd(double.parse(amountController.text));

              Navigator.pop(context);
            },
            child: Text('Save My Money'),
          ),
        ],
      ),
    );
  }
}

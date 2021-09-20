import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:allowance/transaction/models/models.dart';
import 'package:allowance/transaction/views/widgets/widgets.dart';

class Home extends StatelessWidget {
  void _addTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Balance: ',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  context
                      .watch<TransactionController>()
                      .balance
                      .toStringAsFixed(2),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: context.watch<TransactionController>().balance > 0
                        ? Colors.green[900]
                        : Colors.red[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Chart(
              allowance: AllowanceModel.allowanceValue,
            ),
            SizedBox(height: 10),
            TransactionList(
                // transactions:
                //     context.watch<TransactionController>().transactionsList,
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTransaction(context);
        },
        child: Icon(Icons.add),
        elevation: 8,
      ),
    );
  }
}

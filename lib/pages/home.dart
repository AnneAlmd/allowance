import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:allowance/transaction/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  void _addAllowance(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddAllowance();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 200,
            height: 200,
            child: Image.asset('images/pig.png'),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 8,
            child: ListTile(
              leading: Icon(
                Icons.monetization_on_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                context
                    .watch<TransactionController>()
                    .balance
                    .toStringAsFixed(2),
                style: TextStyle(
                  color: context.watch<TransactionController>().balance > 0
                      ? Colors.green[900]
                      : Colors.red[900],
                ),
              ),
              subtitle: Text('Current Balance'),
              trailing: IconButton(
                tooltip: 'Add Money',
                onPressed: () {
                  _addAllowance(context);
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          (context.watch<TransactionController>().transactionsList.isEmpty &&
                  context.watch<TransactionController>().allowanceValue() == 0)
              ? Container(
                  child: Text(
                      'Enter your allowance \n so you can track your expenses'),
                )
              : ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/transactions');
                  },
                  icon: Icon(Icons.list_alt_rounded),
                  label: Text('Transactions'),
                ),
        ],
      ),
    );
  }
}

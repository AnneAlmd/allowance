import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:allowance/transaction/contollers/controllers.dart';
import 'package:allowance/transaction/models/models.dart';
import 'package:allowance/transaction/views/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TransactionController txController = TransactionController();

  List<TransactionModel> transactions = [];
  @override
  void initState() {
    transactions = txController.transactionsList;
    super.initState();
  }

  void _addTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction(addTransaction: txController.addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 8,
              color: Theme.of(context).accentColor,
              child: Text(
                'chart',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _addTransaction(context);
          });
        },
        child: Icon(Icons.add),
        elevation: 8,
      ),
    );
  }
}

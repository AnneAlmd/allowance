import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class TransactionList extends StatelessWidget {
  Widget build(BuildContext context) {
    var itensList = context.watch<TransactionController>().transactionsList;
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListItem(e: itensList[index]);
        },
        itemCount: itensList.length,
      ),
    );
  }
}

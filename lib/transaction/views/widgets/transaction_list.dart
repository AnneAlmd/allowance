import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:allowance/transaction/models/transaction_model.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ...transactions.map(
            (e) {
              return ListTile(
                leading: Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 5,
                  labelPadding: EdgeInsets.all(15),
                  shape: CircleBorder(
                    side: BorderSide.none,
                  ),
                  label: Text(
                    '\$${e.amount}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(e.title),
                subtitle: Text(
                  DateFormat('dd MMM').format(e.date),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

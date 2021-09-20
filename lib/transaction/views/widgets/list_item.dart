import 'package:allowance/transaction/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final TransactionModel e;
  const ListItem({required this.e});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: FittedBox(
          child: Chip(
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
        ),
        title: Text(e.title),
        subtitle: Text(
          DateFormat('MMM dd, yyyy').format(e.date),
        ),
      ),
    );
  }
}

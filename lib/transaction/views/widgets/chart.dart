import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chart extends StatelessWidget {
  final double allowance;
  Chart({
    required this.allowance,
  });

  Widget chartBars(double heightValue) {
    double factor = heightValue / allowance;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 15,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
        ),
        Container(
          width: 15,
          height: 120 * factor.abs(),
          decoration: BoxDecoration(
            color: Colors.purple,
            // (balance - heightValue) > 0 ? Colors.purple : Colors.red[900],
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...context
                .watch<TransactionController>()
                .groupedTransactions
                .map(
                  (e) => Column(
                    children: [
                      chartBars(e['amount'] as double),
                      SizedBox(height: 10),
                      Text(
                        '${e['day']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${e['amount']}'),
                    ],
                  ),
                )
                .toList()
                .reversed,
          ],
        ),
      ),
    );
  }
}

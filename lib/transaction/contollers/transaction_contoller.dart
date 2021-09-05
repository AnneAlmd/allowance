import 'package:allowance/transaction/models/models.dart';

class TransactionController {
  var transactions = [
    TransactionModel(
      id: 1,
      title: 'Açai',
      amount: 10.00,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: 2,
      title: 'Tattoo',
      amount: 120.00,
      date: DateTime.now(),
    ),
  ];
  void addTransaction(TransactionModel item) {
    transactions.add(item);
  }
}

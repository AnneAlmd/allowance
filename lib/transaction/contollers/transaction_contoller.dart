import 'package:allowance/transaction/models/models.dart';

class TransactionController {
  var _transactions = [
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
  List<TransactionModel> get transactionsList => _transactions;

  void addTransaction(
      {required int id,
      required String title,
      required String amount,
      required String date}) {
    try {
      var itemId = _transactions.length;
      var itemAmount = double.parse(amount);
      var itemDate = DateTime.parse(date);

      final item = TransactionModel(
        id: itemId,
        title: title,
        amount: itemAmount,
        date: itemDate,
      );
      _transactions.add(item);
    } catch (e) {
      throw Exception('Something Wrong: $e');
    }
  }
}

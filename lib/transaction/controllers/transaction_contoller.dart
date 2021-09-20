import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:allowance/transaction/models/models.dart';

class TransactionController with ChangeNotifier {
  var allowance = AllowanceModel.allowanceValue;

  var _transactions = [
    TransactionModel(
      id: 1,
      title: 'Açai',
      amount: 100.00,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    TransactionModel(
      id: 2,
      title: 'Tattoo',
      amount: 20.00,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    TransactionModel(
      id: 3,
      title: 'chocolate',
      amount: 20.00,
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    TransactionModel(
      id: 4,
      title: 'Sorvete',
      amount: 25.00,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    TransactionModel(
      id: 5,
      title: 'Tat',
      amount: 100.00,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    TransactionModel(
      id: 6,
      title: 'choco',
      amount: 20.00,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    TransactionModel(
      id: 7,
      title: 'Sorte',
      amount: 55.55,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];
  List<TransactionModel> get transactionsList {
    _transactions.sort((a, b) => b.date.compareTo(a.date));
    return _transactions;
  }

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
      notifyListeners();
    } catch (e) {
      throw Exception('Something Wrong: $e');
    }
  }

  List<Map<String, Object>> get groupedTransactions =>
      List.generate(7, (index) {
        var weekDay = DateTime.now().subtract(Duration(days: index));
        var totalAmount = 0.0;

        for (var i = 0; i < _transactions.length; ++i) {
          if (_transactions[i].date.day == weekDay.day &&
              _transactions[i].date.month == weekDay.month &&
              _transactions[i].date.year == weekDay.year) {
            totalAmount += _transactions[i].amount;
            print(DateFormat.E().format(weekDay));
            print('$totalAmount');
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalAmount
        };
      });

  double get balance {
    var expenses = 0.0;
    groupedTransactions.forEach((element) {
      expenses += element['amount'] as double;
    });
    return allowance - expenses;
  }
}

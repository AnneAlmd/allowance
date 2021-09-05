import 'package:allowance/transaction/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            Card(
              child: ListTile(
                leading: Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 5,
                  labelPadding: EdgeInsets.all(15),
                  shape: CircleBorder(
                    side: BorderSide.none,
                  ),
                  label: Text(
                    '\$11,00',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text('Açai'),
                subtitle: Text('10 sept'),
              ),
            ),
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

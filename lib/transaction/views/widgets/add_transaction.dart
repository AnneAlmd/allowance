import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Date Picker:',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(alignment: Alignment.bottomRight),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

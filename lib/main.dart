import 'package:allowance/pages/home.dart';
import 'package:allowance/transaction/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: Home(),
    );
  }
}

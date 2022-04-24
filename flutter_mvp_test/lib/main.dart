import 'package:flutter/material.dart';
import 'package:flutter_mvp_test/di/dependency_injection.dart';
import 'package:flutter_mvp_test/ui/home_page.dart';

void main() {
  Injector.configure(Flavor.PROD);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:pc04_angie/InputPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario',
      home: InputPage(),
    );
  }
}

import 'package:desafio_picpay/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio PicPay',
      theme: ThemeData(
        primarySwatch: Colors.green,
        //primaryColor: Color(0xFF1D1E20),
        // scaffoldBackgroundColor: Color(0xFF1D1E20),
        //buttonColor: Color(0xFF11C76F)
      ),
      home: HomePage(),
    );
  }
}
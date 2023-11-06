import 'package:flutter/material.dart';
import 'package:mvvm/HomePage.dart';
import 'package:mvvm/Product/InsertProduct.dart';
import 'package:mvvm/helper/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
    //ChangeNotifierProvider(create: (context)=>EmployyProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

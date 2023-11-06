import 'package:flutter/material.dart';
import 'package:mvvm/Product/InsertProduct.dart';
import 'package:mvvm/LoginPage.dart';
import 'package:mvvm/Product/ViewModelProducts.dart';
import 'package:mvvm/RegistrationPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Product',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Bhumika Patel'),
            ),
            ListTile(
              leading: Icon(
                Icons.login,
              ),
              title: const Text('Login'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.app_registration,
              ),
              title: const Text('Registration'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => RegistrationPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add,
              ),
              title: const Text('Prodct Add'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => InsertProduct()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.view_array,
              ),
              title: const Text('Product View'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => ViewModelProducts()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

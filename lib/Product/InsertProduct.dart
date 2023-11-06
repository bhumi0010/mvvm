import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Resourcefile/URL_API.dart';
import 'package:mvvm/helper/ApiHandler.dart';
import 'package:mvvm/helper/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({super.key});

  @override
  State<InsertProduct> createState() => _InsertProductState();
}

class _InsertProductState extends State<InsertProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProductProvider? provider;

  TextEditingController _txtpname = TextEditingController();
  TextEditingController _txtprice = TextEditingController();
  TextEditingController _txtqty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Insert"),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400.0,
          height: 350.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              border: Border.all(
                color: Colors.black, // Border color
                width: 2.0,
              )), // Border width
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey, // Associate the GlobalKey<FormState> with the form
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _txtpname,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'Enter your product name',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your product name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _txtprice,
                      decoration: InputDecoration(
                        labelText: 'Product Price',
                        hintText: 'Enter your product price',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your price';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _txtqty,
                      decoration: InputDecoration(
                        labelText: 'Product Qty',
                        hintText: 'Enter your product Qty',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Qty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var pname = _txtpname.text.toString();
                            var price = _txtprice.text.toString();
                            var qty = _txtqty.text.toString();
                            Map<String, String> body = {
                              "pname": pname,
                              "price": price,
                              "qty": qty,
                            };
                            await provider?.addproduct(body,context);
                          }
                        },
                        child: Text("Submit")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ))),
    );
  }
}

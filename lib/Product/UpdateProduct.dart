import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm/helper/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

class UpdateProduct extends StatefulWidget {
  var Productid;
  UpdateProduct({super.key, this.Productid});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _txtpname = TextEditingController();
  TextEditingController _txtprice = TextEditingController();
  TextEditingController _txtqty = TextEditingController();
  ProductProvider? provider;

  getdata() async {
    Map<String, String> body = {
      "pid": widget.Productid,
    };

    await provider!.singledataproduct(body,context);

    _txtpname.text = provider!.obj!.pname.toString();
    _txtprice.text = provider!.obj!.price.toString();
    _txtqty.text = provider!.obj!.qty.toString();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
      getdata();

  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Update"),
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
                              "qty": qty,
                              "price": price,
                              "pid": widget.Productid
                            };
                            await provider?.updateproduct(body,context);
                          }
                        },
                        child: Text("Update")),
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

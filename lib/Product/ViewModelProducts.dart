import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mvvm/Product/UpdateProduct.dart';
import 'package:mvvm/Resourcefile/URL_API.dart';
import 'package:mvvm/helper/ApiHandler.dart';
import 'package:mvvm/helper/ErrorHandler.dart';
import 'package:mvvm/helper/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

class ViewModelProducts extends StatefulWidget {
  const ViewModelProducts({super.key});

  @override
  State<ViewModelProducts> createState() => _ViewModelProductsState();
}

class _ViewModelProductsState extends State<ViewModelProducts> {

  var pid;

  ProductProvider? provider;

  Future<void> getdata() async {
    try {
      await provider?.viewproduct(context);
    } catch (e) {
      print('Error in getdata: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    provider?.data = [];
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product View"),
      ),
      body: ListView.builder(
          itemCount: provider!.data!.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: ValueKey(provider!.data![index].pname.toString()),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      print("pid${provider!.data![index].pid.toString()}");
                      Map<String, String> param = {
                        "pid": provider!.data![index].pid.toString(),
                      };
                      await provider?.deleteproduct(param,context);
                      getdata();
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      var pid = provider!.data![index].pid.toString();
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProduct(
                                    Productid: pid,
                                  )));
                    },
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.update,
                    label: 'Update',
                  ),
                ],
              ),
              child: ListTile(title: Text(provider!.data![index].pname.toString())),
            );
          }),
    );
  }
}

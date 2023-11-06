import 'package:flutter/material.dart';
import 'package:mvvm/Product/ViewModelProducts.dart';
import 'package:mvvm/Resourcefile/URL_API.dart';
import 'package:mvvm/helper/ApiHandler.dart';
import 'package:mvvm/helper/ErrorHandler.dart';
import 'package:mvvm/model/product.dart';

import '../../NoInternetPage.dart';

class ProductProvider with ChangeNotifier {
  List<product>? data;
  product? obj;

  viewproduct(context) async {
    try {
      await ApiHandler.get(URL_API.VIEW_PRODUCT_URL).then((json) {
        if (json["status"] == "true") {
          var msg = json["message"].toString();
          print(msg);
          print(json['data']);
          data = json['data']
              .map<product>((obj) => product.fromJson(obj))
              .toList();
          notifyListeners();
        } else {
          var msg = json["message"].toString();
          print(msg);
        }
      });
      throw Exception("Something went wrong");
    } on ErrorHandler catch (e) {
      if (e.code == 500) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else {
        print(e.message);
      }
    }
  }

  addproduct(Map<String, String> body, context) async {
    try {
      await ApiHandler.post(URL_API.ADD_PRODUCT_URL, body: body).then((json) {
        if (json["status"] == "true") {
          var msg = json["message"].toString();
          print(msg);
          notifyListeners();
        } else {
          var msg = json["message"].toString();
          print(msg);
        }
      });
      throw Exception("Something went wrong");
    } on ErrorHandler catch (e) {
      if (e.code == 500) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else {
        print(e.message);
      }
    }
  }

  deleteproduct(Map<String, String> param, context) async {
    try {
      await ApiHandler.post(URL_API.DELECT_PRODUCT_URL, body: param)
          .then((json) {
        if (json["status"] == "true") {
          var msg = json["message"].toString();
          print(msg);
          notifyListeners();
        } else {
          var msg = json["message"].toString();
          print(msg);
        }
      });
      throw Exception("Something went wrong");
    } on ErrorHandler catch (e) {
      if (e.code == 500) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else {
        print(e.message);
      }
    }
  }

  singledataproduct(Map<String, String> body, context) async {
    try{
      await ApiHandler.post(URL_API.SINGLE_PRODUCT_URL, body: body).then((json) {
        obj = product.fromJson(json['data']);
      });
    } on ErrorHandler catch (e) {
      if (e.code == 500) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else {
        print(e.message);
      }
    }
  }

  updateproduct(Map<String, String> body, context) async {
    try{
    await ApiHandler.post(URL_API.UPDATE_PRODUCT_URL,
        body: body)
        .then((json) {
      if (json["status"] == "true") {
        var msg = json["message"].toString();
        print(msg);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ViewModelProducts()));
        notifyListeners();
      } else {
        var msg = json["message"].toString();
        print(msg);
      }
    });
    throw Exception("Something went wrong");
    } on ErrorHandler catch (e) {
      if (e.code == 500) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else {
        print(e.message);
      }
    }
  }
}
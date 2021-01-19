import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:online_shop/api.dart';
import 'package:online_shop/models/productModel.dart';

class DataStore{

  static List<ProductModel> _details = List<ProductModel>();

  static List<ProductModel> getProducts(){
    List<ProductModel> models = List<ProductModel>();
    models.add(new ProductModel("Ботинки", 20, "https://www.codeproject.com/KB/GDI-plus/ImageProcessing2/img.jpg","","","", "20.0","","","","","",""));
    return models;
  }

  static List<ProductModel> getDetails(){
    return _details;
  }

  static addDetails(ProductModel model){
    _details.add(model);
  }

  static removeDetails(ProductModel model){
    _details.remove(model);
  }
  
  static getTotal(){
    var cost = 0.0;
    _details.forEach((element) {
      cost += element.price;
    });
    return cost;
  }
  static isEmpty(){
    if(_details.length != 0){
      return true;
    }
    return false;
  }

  static getListFromApi() async {
    var data = await API.getData();
    if(data!=null){
      List<dynamic> jsonData = json.decode(utf8.decode(data.bodyBytes));
      List<ProductModel> models = List<ProductModel>();
      jsonData.forEach((element) {
        models.add(ProductModel.fromJson(element));
      });
      print('Load done');
      return models;
    }else {
      print('Load fail');
      return getProducts();
    }
  }
}
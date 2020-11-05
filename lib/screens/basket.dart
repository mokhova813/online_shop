import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';

import 'detailScreen.dart';

class BasketScreen extends StatefulWidget {
  BasketScreen() : super();


  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<ProductModel> models = new List<ProductModel>();

  @override
  void initState() {
    models.add(new ProductModel("Ботинки", "Почти новые", "20 руб"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Basket"),
      ),

      body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile (
                title: Text (models[index].title),
                leading: Icon(Icons.accessible),
                subtitle: Text(models[index].subtitle),
                trailing: Text(models[index].price),
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder:(context) => DetailScreen(models[index])));
                }

            );
          }
      ),
    );

  }
}

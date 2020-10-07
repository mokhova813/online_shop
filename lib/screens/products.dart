import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';

import 'detailScreen.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen() : super();


  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> models = new List<ProductModel>();

  @override
  void initState() {
    models.add(new ProductModel("Ботинки", "Почти новые", "20 руб"));
    models.add(new ProductModel("Шорты", "Чуть-чуть воняют", "120 руб"));
    models.add(new ProductModel("Носки", "Всего 4 дырки на каждом", "5 руб"));
    models.add(new ProductModel("Футболка", "Крутой желтый рисунок подмышками", "200 руб"));
    models.add(new ProductModel("Куртка", "Рукава продаю отдельно", "100 руб"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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

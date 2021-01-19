import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';
import 'package:online_shop/screens/user.dart';
import 'package:online_shop/store.dart';

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
    models = DataStore.getProducts();
    DataStore.getListFromApi();
    super.initState();
  }

  makeList(){
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: ListTile (
                title: Text (models[index].title),
                leading: Container(
                  child: Image.network(models.elementAt(index).img, fit: BoxFit.fitHeight,),
                ),
                subtitle: Text(models[index].specs+"\n"+models[index].price.toString()+" руб."),
                trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: (){
                    final snackBar = SnackBar(
                      content: Text("Товар добавлен в корзину:\n"+models.elementAt(index).title),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                    setState(() {
                      DataStore.addDetails(models.elementAt(index));
                    });
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder:(context) => DetailScreen(models[index])));
                }
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Каталог"),
        actions:  [IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          tooltip: 'Профиль',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserScreen()),
            );
          },
        ),
        ],
      ),
      body:
          FutureBuilder(
            future: DataStore.getListFromApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                models = snapshot.data;
                return makeList();
              }
              else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          )

    );
  }
}

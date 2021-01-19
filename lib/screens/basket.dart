import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';
import 'package:online_shop/screens/user.dart';
import 'package:online_shop/store.dart';

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
    models = DataStore.getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Корзина"),
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
      models.length != 0 ?
        Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: models.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: ListTile (
                        title: Text (models[index].title),
                        leading: Container(
                          width: 40,
                          height: 40,
                          child: Image.network(models.elementAt(index).img),
                        ),
                        subtitle: Text(models[index].specs+"\n"+models[index].price.toString()+" руб."),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            setState(() {
                              DataStore.removeDetails(models.elementAt(index));
                            });
                          },
                        ),
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: (){},
                child: Text("Оформить заказ на сумму "+DataStore.getTotal().toString()+" руб."),
              ),
            )
          ],
        )
        :
        Center(child: Text("Корзина пуста", style: TextStyle(fontSize: 30),))
    );

  }
}

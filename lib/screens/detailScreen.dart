import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';
import 'package:online_shop/store.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel model;
  DetailScreen(this.model) : super();


  @override
  _DetailScreenState createState() => _DetailScreenState(model);
}

class _DetailScreenState extends State<DetailScreen> {
  final ProductModel model;

  _DetailScreenState(this.model);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(model.title)
          ),
    ),
      body:
    Builder(
    builder: (test) =>Center(
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.5),
              children: [
                AspectRatio(aspectRatio: 1, child: Image.network(model.img, fit: BoxFit.contain,),),
                SizedBox(
                  height: 10.0,
                ),
                Center(child: Text(model.specs, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),)),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Цена: "+model.price.toString()+" руб.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ElevatedButton(
                      onPressed: (){
                        final snackBar = SnackBar(
                          content: Text("Товар добавлен в корзину:\n"+model.title),
                        );
                        Scaffold.of(test).showSnackBar(snackBar);
                        setState(() {
                          DataStore.addDetails(model);
                        });
                      },
                      child: Text("Добавить в корзину", style: TextStyle(fontSize: 16),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("Страна: " + model.region, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18),),
                Text("Крепкость:" + model.alcohol, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18),),
                Text("Объем: " + model.volume, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18),),
                Text("Виноград: " + model.grapes, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18),),
                Text("Производитель: "+model.maker, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 10.0,
                ),
                Text("Описание:", textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),),
                Text("Цвет: " + model.color, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),),
                Text("Вкус: " + model.taste, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),),
                Text("Запах: " + model.smell, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),),
                Text("Гастрономические свойства: " + model.gastr, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),),
            ]
          ),
        ),
      ),
    );
  }
}


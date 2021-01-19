import 'dart:ffi';

class ProductModel{
  final String title;
  final double price;
  final String specs;
  final String region;
  final String alcohol;
  final String volume;
  final String grapes;
  final String maker;
  final String img;
  final String color;
  final String taste;
  final String smell;
  final String gastr;


  ProductModel(this.title, this.price, this.img, this.specs, this.region,
      this.alcohol, this.volume, this.grapes, this.maker, this.color,
      this.taste, this.smell, this.gastr);

  static fromJson(jsonData){
    return ProductModel(jsonData['title'],
        double.parse(jsonData['cost']), jsonData['img'], jsonData['specs'],
        jsonData['region'],jsonData['alcohol'],jsonData['volume'],
        jsonData['grapes'],jsonData['maker'],jsonData['color'],
        jsonData['taste'],jsonData['smell'],jsonData['gastr']);
  }
}


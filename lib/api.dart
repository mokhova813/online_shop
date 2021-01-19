import 'dart:convert';

import 'package:http/http.dart' as http;

class API{
  static Future<http.Response> getData() async{
    //todo api на php или python https://morning-taiga-93503.herokuapp.com/
    //https://6004e7e075860e0017c5bf46.mockapi.io/products
    var res = await http.get("https://morning-taiga-93503.herokuapp.com/");
    if(res.statusCode == 200){
      return res;
    }else {
      return null;
    }
  }
  static Future<http.Response> fetchAlbum() {
    return http.get('https://jsonplaceholder.typicode.com/albums/1');
  }

}
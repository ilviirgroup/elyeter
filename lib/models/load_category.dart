import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

import '../service.dart';

class FetchCategory with ChangeNotifier{
  Uri url = Uri.parse('http://127.0.0.1:8000/app/category-list/?format=json');
  Future<List<Categories>> fetchCategories() async{
    http.Response response = await http.get(url);
    if (response.statusCode ==200){
      return parseCategories(response);
    }
  }
List<Categories> parseCategories(var response){
    final parsed = jsonDecode(utf8.decode(response.bodyBytes)).cast<Map<String, dynamic>>();
    return parsed.map<Categories>((json)=> Categories.fromMap(json)).toList();
}
@override
  void notifyListeners(){
    super.notifyListeners();
}
}
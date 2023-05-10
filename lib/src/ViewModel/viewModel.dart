import 'dart:convert';


import 'package:dd360_test/src/Model/model.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ViewModel with ChangeNotifier {

  // MarvelModel? marvelModel ;

  //  The final privateKey in this case should is in other file, probably with a crypto method. However in this case is fine here.
  final privateKey = 'aea39f754aa53c3207e7455a033367ae10045c8d';

  final publicKey = '5c28ff77e7908458a8255f977f3c9a95';
  final apiUrl = 'http://gateway.marvel.com/v1/public/characters';
  String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

  // This is a message for 'no response'
  final noResponse = "Please check your network connection";



  // late var dataMarvelProvider = DataMarvelProvider().dataMarvelProvider;

  
  //   This is the method that return the hash
  String md5hash(){
    var bytesOfUtf8 = utf8.encode('$timeStamp$privateKey$publicKey');
    var md5Hash = md5.convert(bytesOfUtf8);
    var hash = md5Hash.toString();
    return hash;
  }

  // This make the call to API and validate the response
  Future<MarvelModel?> getResponse() async {
    final hash = md5hash();
    final queryParams = 'ts=$timeStamp&apikey=$publicKey&hash=$hash';
    final url = '$apiUrl?$queryParams';

    final Uri urlConsult = Uri.parse(url);
    final http.Response resp = await http.get(urlConsult);

    if (resp.statusCode == 200){
      final MarvelModel data = MarvelModel.fromJson(json.decode(resp.body));
      return data;
    }else {
      return null;
    }
  }
  

  // MarvelModel? _dataMarvelProvider ;

  // MarvelModel? get dataMarvelProvider => _dataMarvelProvider;

  // set dataMarvelProvider(MarvelModel? model) {
  //   _dataMarvelProvider = model;
  // }
  

}


class DataMarvelProvider extends ChangeNotifier {

  final model = ViewModel().getResponse();

MarvelModel? _dataMarvelProvider ;

  MarvelModel? get dataMarvelProvider => _dataMarvelProvider;

  set dataMarvelProvider(MarvelModel? model) {
    _dataMarvelProvider = model;
  }

}
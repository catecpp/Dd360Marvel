import 'dart:convert';


import 'package:dd360_test/src/Model/model.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ViewModel with ChangeNotifier {

  // MarvelModel? marvelModel ;

  //  The final privateKey in this case should is in other file, probably with a crypto method. However in this case is fine here.
  final privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';

  final publicKey = 'fea4ddbf370376865724c2b03db5ffef';
  final apiUrl = 'http://gateway.marvel.com/v1/public/characters';
  String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

  // This is a message for 'no response'
  final noResponse = "Please check your network connection";
  
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
  
  

}


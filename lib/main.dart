import 'package:dd360_test/src/View/listSuperHerosMarvelPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/Model/model.dart';
import 'src/View/noResponseView.dart';
import 'src/ViewModel/viewModel.dart';

void main() async {
  final MarvelModel? marvelModel = await ViewModel().getResponse();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DataMarvelProvider())
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Preload(model: marvelModel)),
  ));
}

class Preload extends StatelessWidget  {
  final MarvelModel? model;
  const Preload({super.key, required this.model}); 
  @override
  Widget build(BuildContext context) {
    final marvelProvider = Provider.of<DataMarvelProvider>(context); 
    marvelProvider.dataMarvelProvider = model;  
    return marvelProvider.dataMarvelProvider == null ?
     const NoResponseView() :
     const ListSuperHeroMarvelPage();
  }
}

import 'package:dd360_test/src/Model/model.dart';
import 'package:dd360_test/src/Utils/utils.dart';
import 'package:dd360_test/src/View/Widgets/sliver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../ViewModel/ViewModel.dart';
import '../ViewModel/viewModel.dart';


class ListSuperHeroMarvelPage extends StatelessWidget {
  final MarvelModel? model;
  const ListSuperHeroMarvelPage({super.key, this.model});

  // final MarvelModel? model;
  // const ListSuperHeroMarvelPage({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    final height = screenSize(context, "height", 1);
    final width = screenSize(context, "width", 1);


    final modelProvider = Provider.of<DataMarvelProvider>(context);
    // modelProvider.dataMarvelProvider = model;
    // print(object)
    // final String hashDynamic = ViewModel().hashConstruccion();
    // final  url = ViewModel().getUrl();
    // final  data = ViewModel().getDataApi(url);

    // print (url);
      final listDocs = List<Result>.from(modelProvider.dataMarvelProvider!.data.results);
      // final listDocs = List<Result>.from( modelProvider.dataMarvelProvider!.data.results);
    return 
    Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        height: height,
        child: ListView.builder(
          // scrollDirection:  Axis.horizontal,
          shrinkWrap: true,
          itemCount: listDocs.length,
            //  final namesHeros = listDocs;
          itemBuilder: (BuildContext context, int index) {
            // return Text(listDocs[index].name)
            // return Container(
            //   height: height * 0.1,
            //   decoration: BoxDecoration(color: Colors.red),
            // );
            // return Sliver(name: "hola", descript: "hola", tipy: 1, typ: 1);
            return Sliver(idImage: listDocs[index].thumbnail.path, name: listDocs[index].name, descript: listDocs[index].description, tipy: 2, typ: 1);
            // ;
          },
        ),
      ),
    );

    
  }
}


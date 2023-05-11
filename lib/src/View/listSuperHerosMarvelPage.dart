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

  @override
  Widget build(BuildContext context) {
    final height = screenSize(context, "height", 1);

    final modelProvider = Provider.of<DataMarvelProvider>(context);

    final List listRmdonColor = [
      ramdomNumber(6),
      ramdomNumber(6),
      ramdomNumber(6),
      ramdomNumber(6),
      ramdomNumber(6),
      ramdomNumber(6)
    ];

    final listDocs = List<Result>.from(modelProvider.dataMarvelProvider!.data.results);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          FadeInImage(
            placeholderErrorBuilder: (context, error, stackTrace) {
              return Container();
            },
            fadeInCurve: Curves.easeOutQuint,
            fadeInDuration:const  Duration(milliseconds: 600),
            fadeOutCurve: Curves.easeInQuint,
            fadeOutDuration: const Duration(milliseconds: 600),
            imageErrorBuilder: ((context, error, stackTrace) {
              return Image.asset('assets/NotImagestandard_large.jpg');
            }),
            placeholder: const AssetImage('assets/NotImagestandard_large.jpg'),
            image: const NetworkImage(
                'https://cdn.marvel.com/u/prod/marvel/i/mg/c/80/5fcfb8708c0b5/clean.jpg'),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: height,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listDocs.length,
              itemBuilder: (BuildContext context, int index) {
                return Sliver(
                    idImage: listDocs[index].thumbnail.path,
                    name: listDocs[index].name,
                    descript: listDocs[index].description,
                    series: listDocs[index].series.items,
                    typ: 1,
                    comics: listDocs[index].comics.items,
                    events: listDocs[index].events.items,
                    stories: listDocs[index].stories.items,
                    listRmdonColor: listRmdonColor);
              },
            ),
          ),
        ],
      ),
    );
  }
}

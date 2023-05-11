import 'dart:io';

import 'package:flutter/material.dart';

import '../../Model/model.dart';
import '../../Utils/utils.dart';

class DetailOfTitle extends StatelessWidget {
  final String? idImage;
  final String title;
  final String descript;
  final List<ComicsItem> comics;
  final List<ComicsItem> events;
  final List<ComicsItem> series;
  final List<StoriesItem> stories;
  final typ;

  const DetailOfTitle(
      {Key? key,
      required this.idImage,
      required this.title,
      required this.descript,
      required this.comics,
      required this.events,
      required this.series,
      required this.stories,
      required this.typ})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(1.1, 5.0, 1.1, 1.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenSize(context, 'width', 0.056))),
      backgroundColor: Colors.white30,
      content: Container(
          width: screenSize(context, 'height', 1.5),
          margin: const EdgeInsets.only(right: 15.0),
          child: Container(
            margin: EdgeInsets.only(
              right: screenSize(context, 'width', 0.004),
              top: screenSize(context, 'width', 0.029),
              bottom: screenSize(context, 'width', 0.046),
              left: screenSize(context, 'width', 0.04),
            ),
            width: screenSize(context, 'width', 0.000015),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(164, 0, 0, 0),
                      blurRadius: 11,
                      offset: Offset.fromDirection(2.25, (4.7)))
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(96, 72, 12, 163),
                        blurRadius: 11,
                        offset: Offset.fromDirection(2.25, (4)))
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(screenSize(context, 'height', 0.011))),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(164, 0, 0, 0),
                            blurRadius: 11,
                            offset: Offset.fromDirection(2.25, (4)))
                      ],
                      gradient: idImage?[0] == '1'
                          ? const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 238, 162, 0),
                                Color.fromARGB(255, 238, 208, 161),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment(0.65, 1.5),
                              stops: [0.47, 1.5])
                          : idImage?[0] == '2'
                              ? const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 239, 0, 0),
                                    Color.fromARGB(255, 255, 176, 204),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.65, 1.5),
                                  stops: [0.47, 1.1])
                              : idImage?[0] == '3'
                                  ? const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 80, 218, 0),
                                        Color.fromARGB(255, 174, 234, 177),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment(0.65, 1.5),
                                      stops: [0.47, 1.5])
                                  : idImage?[0] == '9'
                                      ? const LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 193, 0, 218),
                                            Color.fromARGB(255, 220, 168, 243),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment(0.65, 1.5),
                                          stops: [0.47, 1.5])
                                      : const LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 104, 0, 239),
                                            Color.fromARGB(255, 34, 0, 56),
                                            // Color.fromARGB(255, 200, 129, 247),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment(0.65, 1.5),
                                          stops: [0.47, 1.1]),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: screenSize(context, 'width', 0.02),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  space(context, 0.005),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: SizedBox(
                                      width: screenSize(context, 'height', 0.33),
                                      child: FadeInImage(
                                        placeholderErrorBuilder:
                                            (context, error, stackTrace) {
                                          if ((error == HttpException) ||
                                              (error == IOException)) {
                                            return Container();
                                          }
                                          return Container();
                                        },
                                        fadeInCurve: Curves.easeOutQuint,
                                        fadeInDuration: Duration(milliseconds: 600),
                                        fadeOutCurve: Curves.easeInQuint,
                                        fadeOutDuration: Duration(milliseconds: 600),
                                        imageErrorBuilder: ((context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/NotImagestandard_large.jpg');
                                        }),
                                        placeholder: const AssetImage(
                                            'assets/NotImagestandard_large.jpg'),
                                        image: NetworkImage(
                                          '$idImage' + '/portrait_uncanny.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  space(context, 0.02),
                                  Expanded(
                                    child: ListView.builder(
                                        physics: const ScrollPhysics(
                                            parent: BouncingScrollPhysics()),
                                        controller: PageController(
                                          initialPage: -4,
                                          viewportFraction: 0.47,
                                        ),
                                        itemCount: 1,
                                        itemBuilder: (BuildContext context, int index) {
                                          return StreamBuilder(
                                              builder: (context, snapshot) {
                                            return Column(
                                              children: [
                                                styleFont(context, title, typ == 1 ? 6 : 7),
                                                space(context, 0.01),
                                                styleFont(
                                                    context, descript, typ == 1 ? 8 : 9),
                                                space(context, 0.015),                                               
                                                setWitgetof(context, comics, "Comics"),
                                                setWitgetof(context, events, "Events"),
                                                setWitgetof(context, series, "Series"),
                                                setWitgetof(context, stories, "Stories"),
                                                space(context, typ == 1 ? 0.011 : 0.001),
                                              ],
                                            );
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenSize(context, 'width', 0.02),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          // }),
          ),
    );
  }

  Widget setWitgetof(BuildContext context, List type, String title) {
    return Column(
       
      children: [
      space(context, 0.051),
      styleFont(context, title, typ == 1 ? 5 : 9),
      space(context, 0.005),
      Container(
        margin: EdgeInsets.only(right: screenSize(context, "width", 0.083)),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, Color.fromARGB(137, 28, 0, 55)], stops: [0.1, 0.96])),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize(context, "width", 0.11)),
          child: !type.isEmpty ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: type.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(context, 0.011),
                  styleFont(context, type[index].name, typ == 1 ? 7 : 9),
                  const Divider(thickness: 1,)
                ],
              );
            },
          ):  styleFont(context, "      - No $title", typ == 1 ? 7 : 9),
        ),
      ),
    ]);
  }
}

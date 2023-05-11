import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../Model/model.dart';
import '../../Utils/utils.dart';
import '../../ViewModel/viewModel.dart';
import 'detailsSuperHero.dart';

class Sliver extends StatelessWidget {
    final String? idImage;
    final String name;
    final List<ComicsItem> comics;
    final List<ComicsItem> events;
    final String descript;
    final List<ComicsItem> series;
    final List<StoriesItem>stories;
    final int typ;
  const Sliver({
    super.key, 
    this.idImage,
    required this.name, 
    required this.comics,
     required this.events, 
    required this.descript, 
    required this.series, 
    required this.typ, required this.stories
    });

  @override
  Widget build(BuildContext context) {
  final TitleProvider titleFront = TitleProvider();
    return GestureDetector(
      onTap: () {
        print(comics);
        showDialog(
            context: context,
            builder: (context) {
              return
              //  Container();
              DetailOfTitle(
                idImage: idImage,
                title: name,
                descript: descript,
                comics: comics,
                events: events,
                series: series,
                stories: stories,
                typ: typ,
              );
            });
      },
      child: Container(
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
                                            Color.fromARGB(255, 23, 0, 39),
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
                              width: screenSize(context, 'width', 0.015),
                            ),
                            Column(
                              children: [
                                space(context, 0.008),
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(typ == 1 ? 6.0 : 4.5),
                                  child: SizedBox(
                                    width: screenSize(
                                        context, 'height', typ == 1 ? 0.104 : 0.056),
                                    child: FadeInImage(
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        if ((error == HttpException) ||
                                            (error == IOException) || 
                                            stackTrace == StackTrace.empty) {
                                          return Container();
                                        }
                                        return Container();
                                      },
                                      fadeInCurve: Curves.easeOutQuint,
                                      fadeInDuration: Duration(milliseconds: 600),
                                      fadeOutCurve: Curves.easeInQuint,
                                      fadeOutDuration: Duration(milliseconds: 600),
                                      imageErrorBuilder: ((context, error, stackTrace) {
                                        // if ((error == HttpException) ||
                                        //     (error == IOException) || 
                                        //     stackTrace == StackTrace.empty) {
                                        //   return Container();
                                        // }
                                        print(error);
                                        return Image.asset('assets/NotImagestandard_large.jpg');
                                      }),
                                      placeholder: const AssetImage('assets/NotImagestandard_large.jpg'),
                                      image:  NetworkImage(idImage!.endsWith("not_available") ?
                                         '$idImage' + '/portrait_xlarge.jpg':
                                         '$idImage' + '/portrait_fantastic.jpg',
                                         ) ,
                                          // 'https://covers.openlibrary.org/b/id/$idImage-L.jpg'),
                                      fit: typ == 1 ? BoxFit.fitHeight : BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                space(context, 0.006),
                              ],
                            ),
                            SizedBox(
                              width: screenSize(context, 'width', 0.02),
                            ),
                            Column(
                              children: [
                                space(context, typ == 1 ? 0.022 : 0.011),
                                Container(
                                  
                                  width: screenSize(
                                      context, 'width', 0.53),
                                      // context, 'height', typ == 1 ? 0.128 : 0.182),
                                  height: screenSize(
                                      context, 'height', typ == 1 ? 0.138 : 0.083),
                                  child: ListView.builder(
                                    
                                      physics: const ScrollPhysics(
                                          parent: BouncingScrollPhysics()),
                                      controller: PageController(
                                        initialPage: typ == 1 ? -2 : -1,
                                        viewportFraction: typ == 1 ? 0.9 : 1.5,
                                      ),
                                      itemCount: 1,
                                      itemBuilder: (BuildContext context, int index) {
                                        return StreamBuilder(builder: (context, snapshot) {
                                          return Column(
                                            children: [                                              
                                              styleFont(context, name, typ == 1 ? 5: 7),
                                              space(context, typ == 1 ? 0.011 : 0.001),
                                              // styleFont(context, author, typ == 1 ? 7 : 9),
                                              space(context, typ == 1 ? 0.011 : 0.0),
                                              // styleFont(
                                              //     context, publishYear, typ == 1 ? 7 : 9),
                                              space(context, 0.011),
                                              typ == 1
                                                  ? Container(
                                                    margin: EdgeInsets.only(left: screenSize(
                                      context, 'width',  0.08)),
                                                      decoration:  const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: [
                                                                  Colors.black12,
                                                                  Colors.transparent
                                                                ],
                                                                  stops: [
                                                                  0.6,
                                                                  0.96
                                                                ])) ,
                                                      child:
                                                          styleFont(context, descript, 9))
                                                  : Container(),
                                              space(context, typ == 1 ? 0.011 : 0.001),
                                            ],
                                          );
                                        });
                                      }),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(                      
                          children:[                             
                            Expanded(child: Container()),                            
                            ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(screenSize(context, 'height', 0.05))),
                            child: StreamBuilder<String?>(
                                stream: titleFront.buttonchangeStream,
                                builder: (context, snapshot) {
                                  return IconButton(
                                      onPressed: (() {
                                        final colorbott =
                                            snapshot.data == 'grey' ? 'green' : 'grey';
                                        titleFront.buttonchangeSink(colorbott);
                                      }),
                                      icon: snapshot.hasData
                                          ? snapshot.data == 'grey'
                                              ? Icon(Icons.check_circle_outlined,
                                                  size: 35,
                                                  shadows: const [
                                                    Shadow(
                                                      color:
                                                          Color.fromARGB(109, 23, 23, 23),
                                                      blurRadius: 10,
                                                    )
                                                  ],
                                                  color: Colors.lightGreenAccent.shade100)
                                              : Icon(
                                                  Icons.add_circle_outlined,
                                                  size: 29,
                                                  color: Color.fromARGB(255, 234, 21, 92)
                                                      .withOpacity(0.74),
                                                )
                                          : Icon(
                                              Icons.add_circle_outlined,
                                              size: 29,
                                              color: Colors.pinkAccent.withOpacity(0.74),
                                            ));
                                }),
                          ),]
                        )
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
  
}
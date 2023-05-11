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
     const AnimationPrelogin();
  }
}


class AnimationPrelogin extends StatefulWidget {
  const AnimationPrelogin({Key? key}) : super(key: key);

  @override
  State<AnimationPrelogin> createState() => _AnimationPreloginState();
}

class _AnimationPreloginState extends State<AnimationPrelogin>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> animationscale;

  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward().whenComplete(() => Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const ListSuperHeroMarvelPage())));
    animationscale = Tween<double>(begin: 0.5, end: 0.8).animate(animation);
    animation.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Transform.scale(
              scale: animationscale.value,
              child: Image.asset("assets/marvel.jpeg"))),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/Model/model.dart';
import 'src/ViewModel/viewModel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget  {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel();


   final  name = viewModel.getResponse();
   print(name);
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("name"),
        ),
      ),
    );
  }
}

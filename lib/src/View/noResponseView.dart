import 'package:dd360_test/src/Utils/utils.dart';
import 'package:flutter/material.dart';

import '../ViewModel/viewModel.dart';


class NoResponseView extends StatelessWidget {
  const NoResponseView({super.key});

// this is a widget that asks to check your network connection

  @override
  Widget build(BuildContext context) {
    final height = screenSize(context, "height", 1);
    final width = screenSize(context, "width", 1);
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text(
          ViewModel().noResponse,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
            color: Colors.amber,
            fontSize: width * 0.05,             
          ),
          )),
    );
  }
}
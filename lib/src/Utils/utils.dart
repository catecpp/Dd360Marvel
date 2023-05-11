import 'dart:math';

import 'package:flutter/material.dart';

// Function that calculates the size of the screen based on the height or width

screenSize(context, String his, double hisvar) {
  final screenSize = MediaQuery.of(context).size;
  final sHeight = (screenSize.width > screenSize.height)
      ? (screenSize.height * hisvar) * 2.4
      : (screenSize.height * hisvar);
  final sWidth = screenSize.width * hisvar;
  if (his == 'height') {
    return sHeight;
  } else if (his == 'width') {
    return sWidth;
  } else {}
}

// Widget that returns a vertical empty space with a given size
Widget space(context, double hisvar) {
  return (SizedBox(
    height: screenSize(context, 'height', hisvar),
  ));
}

isnumeric(dynamic data) {
  if ((data.isEmpty) || (data == null)) return false;
  final n = num.tryParse(data);
  return (n == null) ? false : true;
}

// Widget that returns a text with a certain style
Widget styleFont(BuildContext context, String title, int hierarchy) {
  return Text(title,
      textAlign: hierarchy == 1
          ? TextAlign.center
          : hierarchy == 2
              ? TextAlign.center
              : hierarchy == 3
                  ? TextAlign.left
                  : hierarchy == 4
                      ? TextAlign.left
                      : hierarchy == 5
                          ? TextAlign.left
                          : hierarchy == 6
                              ? TextAlign.left
                              : hierarchy == 7
                                  ? TextAlign.left
                                  : hierarchy == 8
                                      ? TextAlign.center
                                      : TextAlign.left,
      style: TextStyle(
        fontStyle: hierarchy == 1
            ? FontStyle.normal
            : hierarchy == 2
                ? FontStyle.normal
                : hierarchy == 3
                    ? FontStyle.normal
                    : hierarchy == 4
                        ? FontStyle.normal
                        : hierarchy == 5
                            ? FontStyle.normal
                            : hierarchy == 6
                                ? FontStyle.normal
                                : hierarchy == 7
                                    ? FontStyle.italic
                                    : hierarchy == 8
                                        ? FontStyle.normal
                                        : FontStyle.normal,
        shadows: [
          Shadow(
            color: const Color.fromARGB(164, 0, 0, 0),
            blurRadius: hierarchy == 1
                ? 20
                : hierarchy == 2
                    ? 20
                    : hierarchy == 3
                        ? 5
                        : hierarchy == 4
                            ? 11
                            : hierarchy == 5
                                ? 5
                                : hierarchy == 6
                                    ? 22
                                    : hierarchy == 7
                                        ? 3
                                        : 5,
            offset: hierarchy == 1
                ? Offset.fromDirection(2, (4))
                : hierarchy == 2
                    ? Offset.fromDirection(2, (4))
                    : hierarchy == 3
                        ? Offset.fromDirection(2, (6))
                        : hierarchy == 4
                            ? Offset.fromDirection(2.25, (4))
                            : hierarchy == 5
                                ? Offset.zero
                                : hierarchy == 6
                                    ? Offset.fromDirection(2.25, (4))
                                    : hierarchy == 7
                                        ? Offset.zero
                                        : Offset.zero,
          )
        ],
        fontWeight: hierarchy == 1
            ? FontWeight.w700
            : hierarchy == 2
                ? FontWeight.w700
                : hierarchy == 3
                    ? FontWeight.w700
                    : hierarchy == 4
                        ? FontWeight.w600
                        : hierarchy == 5
                            ? FontWeight.w600
                            : hierarchy == 6
                                ? FontWeight.w600
                                : hierarchy == 7
                                    ? FontWeight.w500
                                    : hierarchy == 8
                                        ? FontWeight.w600
                                        : FontWeight.w400,
        fontFamily: "Segoe UI Semilight 350",
        color: hierarchy == 1
            ? Colors.white
            : hierarchy == 2
                ? Colors.black
                : hierarchy == 3
                    ? Colors.white
                    : hierarchy == 4
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : hierarchy == 5
                            ? const Color.fromARGB(245, 255, 255, 255)
                            : hierarchy == 6
                                ? const Color.fromARGB(255, 255, 236, 192)
                                : hierarchy == 7
                                    ? Colors.white
                                    : hierarchy == 8
                                        ? Colors.white
                                        : Colors.white,
        fontSize: hierarchy == 1
            ? screenSize(context, 'width', 0.06)
            : hierarchy == 2
                ? screenSize(context, 'width', 0.06)
                : hierarchy == 3
                    ? screenSize(context, 'width', 0.06)
                    : hierarchy == 4
                        ? screenSize(context, 'width', 0.051)
                        : hierarchy == 5
                            ? screenSize(context, 'width', 0.042)
                            : hierarchy == 6
                                ? screenSize(context, 'width', 0.051)
                                : hierarchy == 7
                                    ? screenSize(context, 'width', 0.035)
                                    : hierarchy == 8
                                        ? screenSize(context, 'width', 0.035)
                                        : screenSize(context, 'width', 0.029),
      ));
}

int ramdomNumber(int limitMax) {
  var random = Random();
  return random.nextInt(limitMax);
}




import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  const ShadowText(this.data, {Key? key,  required this.style }) : super(key: key);

  final String data;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return  ClipRect(
      child:  Stack(
        children: [
           Positioned(
            top: 2.0,
            left: 2.0,
            child:  Text(
              data,
              style: style.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
           BackdropFilter(
            filter:  ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child:  Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
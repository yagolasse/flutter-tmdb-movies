import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredImage extends StatelessWidget {
  final NetworkImage _image;

  BlurredImage(this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 100.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _image,
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ));
  }
}

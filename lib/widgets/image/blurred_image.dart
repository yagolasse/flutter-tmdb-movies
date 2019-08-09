import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredImage extends StatelessWidget {
  final String _url;

  BlurredImage(this._url);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 100.0,
        ),
        decoration: BoxDecoration(

          image: DecorationImage(
            image: NetworkImage('http://image.tmdb.org/t/p/w185//' + _url),
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

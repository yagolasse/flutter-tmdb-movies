import 'package:flutter/material.dart';

class ImageBannerRound extends StatelessWidget {

  final String _path;

  ImageBannerRound(this._path);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(16.0),
      child: Image.network(
        'http://image.tmdb.org/t/p/w185//' + _path,
        fit: BoxFit.cover,
        height: 96.0,
        width: 72.0,
      ),
    );
  }
}

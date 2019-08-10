import 'package:flutter/material.dart';

class ImageRepository {
  final String _apiBaseUrl;
  static const Small = 0;
  static const Medium = 1;
  static const Large = 2;

  ImageRepository(this._apiBaseUrl);

  NetworkImage loadFromApi(String url, int size) {
    String imageSize;
    switch(size) {
      case 1:
        imageSize = 'w320';
        break;
      case 2:
        imageSize = 'w500';
        break;
      default:
        imageSize = 'w185';
    }
    return NetworkImage("$_apiBaseUrl$imageSize//$url");
  }
}
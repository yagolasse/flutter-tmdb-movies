import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_flutter/models/movie.dart';

class MovieRepository {

  final String _apiBaseUrl;
  final String _apiKey;

  static const MOVIE_URL = 'movie/';
  static const API_KEY_PREFIX = '?api_key=';

  MovieRepository(this._apiBaseUrl, this._apiKey);

  Future<Movie> fetchById(int id) async {
    final response = await http.get(_apiBaseUrl + MOVIE_URL + id.toString() + API_KEY_PREFIX + _apiKey);
    if(response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falied to load');
    }
  } 
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/screens/common/loading_default.dart';
import 'package:movies_flutter/screens/movie_detail/movie_detail.success.dart';

const MAX_IMAGE_HEIGHT = 500.0;

class MovieDetail extends StatelessWidget {
  final Future<Movie> movie;

  MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: FutureBuilder(
        future: movie, // a previously-obtained Future<?> or null
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Success(snapshot.data);
          }
          if (snapshot.hasError) {
          }
          return LoadingDefault();
        },
      ),
    );
  }
}

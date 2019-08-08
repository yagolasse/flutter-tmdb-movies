import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';
import 'package:movies_flutter/widgets/text/meta_display.dart';
import 'package:movies_flutter/widgets/text/text_border_round.dart';
import 'package:transparent_image/transparent_image.dart';

const MAX_IMAGE_HEIGHT = 500.0;

class MovieDetail extends StatelessWidget {
  final Future<Movie> movie;

  MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _dataScaffold(snapshot.data);
          }
          if (snapshot.hasError) {
            return _errorScaffold(snapshot.error);
          }
          return _loadingScaffold();
        });
  }

  Scaffold _dataScaffold(Movie movie) {
    return Scaffold(
        appBar: AppBar(title: Text(movie.title)),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextBorderRound(["16+"], true),
              TextBorderRound(["1h 23m"]),
              TextBorderRound(["Animation", "Action", "Crime"]),
              TextBorderRound(["JP", "1995"]),
            ],
          ),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MetaDisplay("Direção", ["Masamoru Oshii"]),
              MetaDisplay("Roteiro", ["Masamune Shirow", "Kazunori Itô"])
            ],
          )

        ])
        // Stack(
        //   children: <Widget>[
        //     Center(child: CircularProgressIndicator()),
        //     Container(
        //       padding: EdgeInsets.all(16.0),
        //       constraints: BoxConstraints.expand(
        //         height: MAX_IMAGE_HEIGHT,
        //       ),
        //       child: FadeInImage.memoryNetwork(
        //         placeholder: kTransparentImage,
        //         image: 'http://image.tmdb.org/t/p/w185//' + movie.posterPath,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ],
        // ),
        );
  }

  Scaffold _errorScaffold(String errorMessae) {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(child: Text(errorMessae)),
    );
  }

  Scaffold _loadingScaffold() {
    return Scaffold(
      appBar: AppBar(title: Text('Loading...')),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

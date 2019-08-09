import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/widgets/button/floating_action_button_mini.dart';
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
            return _dataScaffold(context, snapshot.data);
          }
          if (snapshot.hasError) {
            return _errorScaffold(snapshot.error);
          }
          return _loadingScaffold();
        });
  }

  Scaffold _dataScaffold(BuildContext context, Movie movie) {
    final textWidth = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(title: Text(movie.title)),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // FloatingActionButtonMini(Icons.arrow_back, () {}),
          Column(children: [
            _movieInfo(),
            Center(
            child: Row(children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Why doesn't this text wrap? There's plenty of vertical space...")
                  ],
                ),
              ),
            ])
        )
            Column(children: [Flexible(child: Text(movie.overview))]),
            // Container(width: textWidth, alignment: Alignment.centerLeft, child: Text(movie.overview)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MetaDisplay("Direção", ["Masamoru Oshii"]),
                MetaDisplay("Roteiro", ["Masamune Shirow", "Kazunori Itô"])
              ],
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButtonMini(Icons.arrow_back, () {}),
              FloatingActionButtonMini(Icons.arrow_back, () {}),
            ],
          )
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
        ]));
  }

  Widget _movieInfo() {
    return Container(
        child: Row(children: [
      TextBorderRound(["16+"], true),
      TextBorderRound(["1h 23m"]),
      TextBorderRound(["Animation", "Action", "Crime"]),
      TextBorderRound(["JP", "1995"]),
    ]));
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

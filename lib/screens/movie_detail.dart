import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/widgets/button/floating_action_button_mini.dart';
import 'package:movies_flutter/widgets/image/blurred_image.dart';
import 'package:movies_flutter/widgets/text/meta_display.dart';
import 'package:movies_flutter/widgets/text/text_area.dart';
import 'package:movies_flutter/widgets/text/text_border_round.dart';

const MAX_IMAGE_HEIGHT = 500.0;

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return FutureBuilder<Movie>(
//        future: movie,
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
    return _dataScaffold(context, this.movie /*snapshot.data*/);
//          }
//          if (snapshot.hasError) {
//            return _errorScaffold(snapshot.error);
//          }
//          return _loadingScaffold();
//        });
  }

  Widget _dataScaffold(BuildContext context, Movie movie) {
    return Scaffold(
        body: Stack(children: [
//      BlurredImage(movie.posterPath),
      Container(
        margin: const EdgeInsets.only(left: 48.0, top: 32.0),
        child: Column(children: [
          _movieInfo(),
          TextArea(
              'sifghasiudhfpsudhfpodufnpoudfASPDOFUHpasodfhohasdfoshdafoshadfoshdfoashdmnpvhxoczvhosuhrsovochvzxovh'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MetaDisplay("Direção", ["Masamoru Oshii"]),
              MetaDisplay("Roteiro", ["Masamune Shirow", "Kazunori Itô"]),
            ],
          ),
        ]),
      ),
      _buttonsSection()
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

  Widget _buttonsSection() {
    const mainMargin = EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0);
    return Container(
        margin: mainMargin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MiniFloatingActionButton(Icons.arrow_back, () {}),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: MiniFloatingActionButton(Icons.edit, () {}),
                ),
                MiniFloatingActionButton(Icons.share, () {}),
              ],
            )
          ],
        ));
  }

  Scaffold _errorScaffold(String errorMessage) {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(child: Text(errorMessage)),
    );
  }

  Scaffold _loadingScaffold() {
    return Scaffold(
      appBar: AppBar(title: Text('Loading...')),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

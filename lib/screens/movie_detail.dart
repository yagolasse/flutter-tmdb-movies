import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/widgets/button/floating_action_button_mini.dart';
import 'package:movies_flutter/widgets/image/blurred_image.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';
import 'package:movies_flutter/widgets/text/meta_display.dart';
import 'package:movies_flutter/widgets/text/text_area.dart';
import 'package:movies_flutter/widgets/text/text_border_round.dart';

const MAX_IMAGE_HEIGHT = 500.0;

class MovieDetail extends StatelessWidget {
  final Future<Movie> movie;

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

  Widget _dataScaffold(BuildContext context, Future<Movie> movie) {
    return Scaffold(
        body: FutureBuilder(
            future: movie, // a previously-obtained Future<String> or null
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Movie movie = snapshot.data;
                return Stack(children: [
                  BlurredImage(movie.posterPath),
                  SingleChildScrollView(
                      child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 24.0),
                        child: Text(movie.title,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 20.0))),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 64.0, top: 128.0, right: 56.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 24.0),
                                child: _movieInfo(movie)),
                            Container(
                                margin: const EdgeInsets.only(top: 24.0),
                                child: TextArea(movie.overview)),
                            Container(
                                margin: const EdgeInsets.only(top: 24.0),
                                child: _metaDisplays(movie)),
                            Container(
                                margin: const EdgeInsets.only(top: 24.0),
                                child: HighlightedTitle("Cast")),
                          ]),
                    ),
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(16.0),
                      child: Image.network(
                        'http://image.tmdb.org/t/p/w185//' +
                            movie.credits.cast[0].profilePath,
                        fit: BoxFit.cover,
                        height: 96.0,
                        width: 72.0,
                      ),
                    )
                  ])),
                  _buttonsSection()
                ]);
              }
              return Container();
            }));
  }

  Widget _movieInfo(Movie movie) {
    final String formattedRuntime = movie.getFormattedRuntime();
    final String releasingYear = movie.getReleasingYear();
    final List<String> genres =
        movie.genres.map((current) => current.name).toList();
    final List<String> productionCountries =
        movie.productionCountries.map((current) => current.iso31661).toList();
    // add releasing year to show
    productionCountries.add(releasingYear);
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      //TODO map certificates to rating
      //TextBorderRound(["16+"], true),
      TextBorderRound([formattedRuntime], true),
      TextBorderRound(genres),
      TextBorderRound(productionCountries),
    ]));
  }

  Widget _metaDisplays(Movie movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MetaDisplay("Directors",
            movie.credits.directors.map((crew) => crew.name).toList()),
        MetaDisplay(
            "Writers", movie.credits.writers.map((crew) => crew.name).toList()),
      ],
    );
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

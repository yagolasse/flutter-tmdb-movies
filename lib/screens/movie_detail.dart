import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/models/credits.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/repository/image_repository.dart';
import 'package:movies_flutter/widgets/button/floating_action_button_mini.dart';
import 'package:movies_flutter/widgets/image/blurred_image.dart';
import 'package:movies_flutter/widgets/image/image_banner_round.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';
import 'package:movies_flutter/widgets/text/meta_display.dart';
import 'package:movies_flutter/widgets/text/text_area.dart';
import 'package:movies_flutter/widgets/text/text_border_round.dart';

const MAX_IMAGE_HEIGHT = 500.0;

class MovieDetail extends StatelessWidget {
  final Future<Movie> movie;
  final ImageRepository _imageRepository =
      ImageRepository('http://image.tmdb.org/t/p/');

  MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: movie, // a previously-obtained Future<String> or null
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Movie movie = snapshot.data;

                final NetworkImage moviePoster = _imageRepository.loadFromApi(
                    movie.posterPath, ImageRepository.Large);

                final EdgeInsets globalMargins =
                    EdgeInsets.only(left: 64.0, top: 128.0, right: 56.0);

                final TextStyle titleTextStyle =
                    Theme.of(context).textTheme.title;

                final Container titleContainer = Container(
                    margin: const EdgeInsets.only(top: 48.0),
                    child: Text(movie.title,
                        textAlign: TextAlign.start, style: titleTextStyle));

                return Stack(children: [
                  BlurredImage(moviePoster),
                  SingleChildScrollView(
                      child: Column(children: [
                    titleContainer,
                    Container(
                      margin: globalMargins,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _spacedView(_movieInfo(movie)),
                            _spacedView(TextArea(movie.overview)),
                            _spacedView(_metaDisplays(movie)),
                            _spacedView(HighlightedTitle("Cast")),
                          ]),
                    ),
                    ImageBannerRound(movie.credits.cast[0].profilePath)
                  ])),
                  _buttonsSection()
                ]);
              }
              if (snapshot.hasError) {
                return Center(
                    child: Text('An error has ocurred while loading'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _spacedView(Widget another) {
    return Container(margin: const EdgeInsets.only(top: 24.0), child: another);
  }

  Widget _movieInfo(Movie movie) {
    final String formattedRuntime = movie.getFormattedRuntime();
    final String releasingYear = movie.getReleasingYear();
    final List<String> genres =
        movie.genres.map((current) => current.name).toList();
    final List<String> productionCountries =
        movie.productionCountries.map((current) => current.iso31661).toList();
    // add releasing year to show comma separated with countries
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
    final Credits credits = movie.credits;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MetaDisplay("Directors", credits.getDirectorsNames()),
        MetaDisplay("Writers", credits.getWritersNames()),
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
}

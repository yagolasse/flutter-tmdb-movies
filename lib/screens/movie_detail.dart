import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/models/credits.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/repository/image_repository.dart';
import 'package:movies_flutter/widgets/button/floating_action_button_mini.dart';
import 'package:movies_flutter/widgets/component/vertical_data_crossection.dart';
import 'package:movies_flutter/widgets/image/blurred_image.dart';
import 'package:movies_flutter/widgets/image/image_banner_round.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';
import 'package:movies_flutter/widgets/text/meta_display.dart';
import 'package:movies_flutter/widgets/text/simple_title.dart';
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
            future: movie, // a previously-obtained Future<?> or null
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Movie movie = snapshot.data;

                final Credits credits = movie.credits;

                final NetworkImage moviePoster = _imageRepository.loadFromApi(
                  movie.posterPath,
                  ImageRepository.Large,
                );

                final Widget metaDisplays = Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MetaDisplay("Directors", credits.getDirectorsNames()),
                    MetaDisplay("Writers", credits.getWritersNames()),
                  ],
                );

                final EdgeInsets globalMargins = EdgeInsets.only(
                  left: 64.0,
                  top: 64.0,
                  right: 56.0,
                );

                final List<String> yearCountryInfo = List<String>();

                yearCountryInfo.addAll(movie.getFormattedProductionCountries());

                yearCountryInfo.add(movie.getReleasingYear());

                final Container movieInfo = Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //TODO: map certificates to rating
                      //TextBorderRound(["16+"], true),
                      TextBorderRound([movie.getFormattedRuntime()], true),
                      TextBorderRound(movie.getFormattedGenres()),
                      TextBorderRound(yearCountryInfo),
                    ],
                  ),
                );
                return Stack(
                  children: [
                    BlurredImage(moviePoster),
                    SingleChildScrollView(
                      child: VerticalDataCrossSection(null, [
                        SimpleTitle(movie.title),
                        VerticalDataCrossSection(globalMargins, [
                          _spacedView(movieInfo),
                          _spacedView(TextArea(movie.overview)),
                          _spacedView(metaDisplays),
                          _spacedView(HighlightedTitle("Cast")),
                        ]),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 196.0,
                          child: ListView.builder(
                            itemCount: movie.credits.cast.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final Actor actor = movie.credits.cast[index];
                              return CastBannerRound(actor);
                            },
                          ),
                        ),
                      ]),
                    ),
                    _buttonsSection(),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('An error has ocurred while loading'),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _spacedView(Widget another) {
    return Container(margin: const EdgeInsets.only(top: 24.0), child: another);
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
            ),
          ],
        ));
  }
}

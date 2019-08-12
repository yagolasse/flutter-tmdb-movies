import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/widgets/text/text_border_round.dart';

class MovieInfo extends StatelessWidget {
  final Movie _movie;

  MovieInfo(this._movie);

  @override
  Widget build(BuildContext context) {
    final List<String> yearCountryInfo = List<String>();
    yearCountryInfo.addAll(_movie.getFormattedProductionCountries());
    yearCountryInfo.add(_movie.getReleasingYear());

    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // TODO: map certificates to rating
          //TextBorderRound(["16+"], true),
          TextBorderRound([_movie.getFormattedRuntime()], true),
          TextBorderRound(_movie.getFormattedGenres()),
          TextBorderRound(yearCountryInfo),
        ],
      ),
    );
  }
}

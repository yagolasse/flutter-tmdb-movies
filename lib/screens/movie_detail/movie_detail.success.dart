import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/repository/image_repository.dart';
import 'package:movies_flutter/screens/movie_detail/movie_detail.cast_list.dart';
import 'package:movies_flutter/screens/movie_detail/movie_detal.action_button_group.dart';
import 'package:movies_flutter/widgets/component/vertical_data_crossection.dart';
import 'package:movies_flutter/widgets/image/blurred_image.dart';
import 'package:movies_flutter/widgets/text/simple_title.dart';
import 'package:movies_flutter/widgets/text/text_area.dart';

import 'movie_detail.meta_display_group.dart';
import 'movie_detail.movie_info.dart';

class Success extends StatelessWidget {
  final Movie _movie;

  Success(this._movie);

  @override
  Widget build(BuildContext context) {
    final ImageRepository _imageRepository =
        ImageRepository('http://image.tmdb.org/t/p/');

    final NetworkImage moviePoster = _imageRepository.loadFromApi(
      _movie.posterPath,
      ImageRepository.Large,
    );

    final EdgeInsets globalMargins = EdgeInsets.only(
      left: 0.0,
      top: 64.0,
    );
    return Scaffold(
        body: Stack(
      children: [
        BlurredImage(moviePoster),
        SingleChildScrollView(
          child: VerticalDataCrossSection(null, [
            SimpleTitle(_movie.title),
            VerticalDataCrossSection(globalMargins, [
              MovieInfo(_movie),
              _spacedView(TextArea(_movie.overview)),
              MetaDisplayGroup(_movie.credits),
              CastList(_movie.credits.cast),
            ]),
          ]),
        ),
        ActionButtonGroup(),
      ],
    ));
  }

  Widget _spacedView(Widget another) {
    return Container(margin: const EdgeInsets.only(top: 24.0), child: another);
  }
}

import 'package:flutter/material.dart';
import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/screens/movie_detail/movie_detail.dart';
import 'package:movies_flutter/widgets/image/cast_banner.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';

class CastList extends StatelessWidget {
  final List<Actor> _cast;

  CastList(this._cast);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(left: MovieDetail.MarginLeft),
          child: HighlightedTitle("Cast"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          height: 196.0,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final Actor actor = _cast[index];
              return CastBanner(actor);
            },
          ),
        ),
      ],
    );
  }
}

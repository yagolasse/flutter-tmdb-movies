import 'package:flutter/material.dart';
import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/widgets/image/image_banner_round.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';

class CastList extends StatelessWidget {
  final List<Actor> _cast;

  CastList(this._cast);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: HighlightedTitle("Cast"),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 196.0,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final Actor actor = _cast[index];
              return CastBannerRound(actor);
            },
          ),
        ),
      ],
    );
  }
}

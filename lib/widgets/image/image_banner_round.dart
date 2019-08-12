import 'package:flutter/material.dart';
import 'package:movies_flutter/models/actor.dart';

class CastBannerRound extends StatelessWidget {
  final Actor _actor;

  CastBannerRound(this._actor);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: new BorderRadius.circular(16.0),
              child: Material(
                elevation: 16.0,
                child: Image.network(
                  'http://image.tmdb.org/t/p/w185//' + _actor.profilePath,
                  fit: BoxFit.cover,
                  height: 128.0,
                  width: 96.0,
                ),
              ),
            ),
            Text(
              _actor.name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              _actor.character,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .copyWith(color: Colors.grey[400]),
            ),
          ],
        ));
  }
}

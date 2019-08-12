import 'package:flutter/material.dart';
import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/widgets/image/image_banner_round.dart';

class CastBanner extends StatelessWidget {
  final Actor _actor;

  CastBanner(this._actor);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ImageBannerRound(),
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

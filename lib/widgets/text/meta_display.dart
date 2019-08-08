import 'package:flutter/material.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';

class MetaDisplay extends StatelessWidget {
  final String _title;
  final List<String> _values;

  MetaDisplay(this._title, this._values);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HighlightedTitle(_title),      
      ]..addAll(_values.map((current) => _buildItem(context, current)).toList()),
    );
  }

  Widget _buildItem(BuildContext context, String current) {
    return Container(
        margin: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
        padding: const EdgeInsets.fromLTRB(8.0 + 3.0, 0.0, 0.0, 0.0),
        child: Text(current,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: Colors.black, fontSize: 18.0)));
  }
}

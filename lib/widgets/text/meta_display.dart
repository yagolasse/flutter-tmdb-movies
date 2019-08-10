import 'package:flutter/material.dart';
import 'package:movies_flutter/widgets/text/highlighted_title.dart';

class MetaDisplay extends StatelessWidget {
  final String _title;
  final List<String> _values;

  MetaDisplay(this._title, this._values);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin = EdgeInsets.only(bottom: 8.0);
    final List<Widget> mappedItems =
        _values.map((current) => _buildItem(context, current)).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: margin, child: HighlightedTitle(_title)),
      ]..addAll(mappedItems),
    );
  }

  Widget _buildItem(BuildContext context, String current) {
    final EdgeInsets margin = EdgeInsets.only(left: 11.0, bottom: 4.0);
    final TextStyle textStyle =
        Theme.of(context).textTheme.display1.copyWith(color: Colors.grey[400]);

    return Container(margin: margin, child: Text(current, style: textStyle));
  }
}

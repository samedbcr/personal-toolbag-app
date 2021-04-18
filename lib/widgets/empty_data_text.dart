import 'package:flutter/material.dart';

class EmptyDataText extends StatelessWidget {
  const EmptyDataText({
    Key key,
    @required this.context,
    @required this.text,
  }) : super(key: key);

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

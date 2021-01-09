import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key key,
    this.bgColor,
    this.text,
    this.date,
    this.icon,
    this.margin,
  }) : super(key: key);

  final Color bgColor;
  final Widget icon;
  final String text;
  final String date;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(.30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 14),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(
            date,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

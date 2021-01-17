import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key key,
    this.bgColor,
    this.text,
    this.date,
    this.icon,
    this.margin,
    this.isDismissible = false,
    this.onDismiss,
  }) : super(key: key);

  final Color bgColor;
  final Widget icon;
  final String text;
  final String date;
  final EdgeInsetsGeometry margin;
  final bool isDismissible;
  final DismissDirectionCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return isDismissible
        ? Dismissible(
            key: key,
            onDismissed: onDismiss,
            background: Container(
              color: Colors.red,
            ),
            child: cardContainer(context),
          )
        : cardContainer(context);
  }

  Container cardContainer(BuildContext context) {
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

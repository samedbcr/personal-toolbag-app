import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key key,
    this.bgColor,
    this.text,
    this.margin,
    this.onChange,
    this.isChecked,
  }) : super(key: key);

  final Color bgColor;
  final String text;
  final EdgeInsetsGeometry margin;
  final ValueChanged onChange;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return cardContainer(context);
  }

  Container cardContainer(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: bgColor.withOpacity(.30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CheckboxListTile(
        activeColor: AppConstants.green,
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.w500,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        value: isChecked,
        onChanged: onChange,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

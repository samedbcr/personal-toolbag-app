import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInputDialog extends StatefulWidget {
  final String text;

  const CustomInputDialog({Key key, this.text}) : super(key: key);

  @override
  _CustomInputDialogState createState() => _CustomInputDialogState();
}

class _CustomInputDialogState extends State<CustomInputDialog> {
  final _textInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * .50,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSvgPicture(),
            SizedBox(height: 8),
            buildText(context),
            SizedBox(height: 24),
            buildTextField(),
            SizedBox(height: 24),
            buildOkButton(context),
          ],
        ),
      ),
    );
  }

  Expanded buildSvgPicture() {
    return Expanded(
      child: SvgPicture.asset(
        "assets/images/checklist.svg",
        height: MediaQuery.of(context).size.width * .4,
      ),
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          .copyWith(fontWeight: FontWeight.w500),
    );
  }

  TextField buildTextField() {
    return TextField(
      controller: _textInputController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppConstants.darkGrey,
          ),
        ),
        hintText: 'Enter here',
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  ElevatedButton buildOkButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context, _textInputController.text);
      },
      icon: Icon(
        Icons.done_rounded,
        color: Colors.white,
      ),
      label: Text(
        'OK!',
        style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        primary: AppConstants.green,
      ),
    );
  }
}

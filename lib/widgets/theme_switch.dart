import 'package:PersonalToolbag/core/providers/theme_provider.dart';
import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<ThemeProvider>(context).isDark,
      onChanged: (value) {
        Provider.of<ThemeProvider>(context, listen: false).changeTheme();
      },
      activeTrackColor: Colors.green,
      activeColor: AppConstants.green,
    );
  }
}

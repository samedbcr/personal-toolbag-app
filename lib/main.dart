import 'package:PersonalToolbag/theme/custom_light_theme.dart';
import 'package:PersonalToolbag/view/hes_code_view.dart';
import 'package:PersonalToolbag/view/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/hes_code': (context) => HesCodeView(),
      },
    );
  }
}

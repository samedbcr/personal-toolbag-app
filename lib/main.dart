import 'package:PersonalToolbag/core/providers/theme_provider.dart';
import 'package:PersonalToolbag/view/hes_code_view.dart';
import 'package:PersonalToolbag/view/home_view.dart';
import 'package:PersonalToolbag/view/to_do_list_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/hes_code': (context) => HesCodeView(),
        '/to_do': (context) => TodoListView(),
      },
    );
  }
}

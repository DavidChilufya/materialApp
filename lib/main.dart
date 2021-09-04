
import 'package:flutter/material.dart';

import 'screens/details.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xff03da9d);
  final Color accentColor = Colors.orangeAccent;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Learner Support Material',
          theme: ThemeData(
            primaryColor: primaryColor,
            //accentColor: accentColor,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: primaryColor),
            primarySwatch: Colors.green,
            fontFamily: 'Rubik',
            textTheme: const TextTheme(
              headline4:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              headline3: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              button: TextStyle(color: Colors.white),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: primaryColor,
              textTheme: ButtonTextTheme.normal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.all(8),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(style: BorderStyle.none),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          routes: {
            Details.id: (context) => Details(),
          },
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
  }
}

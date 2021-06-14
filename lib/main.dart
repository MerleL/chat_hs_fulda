// @dart=2.9
import 'package:chat_hs_fulda/screens/login_screen.dart';
import 'package:flutter/material.dart';

// ToDo FontFamily
// ToDo: Automatische Abmeldung nach bstimmter Zeit
// ToDo: Sprache waehlbar
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CH@',
      theme: ThemeData(
        // Icons:
        primaryColor: Color.fromARGB(255, 0, 0, 0),
        accentColor: Color.fromARGB(255, 220, 220, 220),
        fontFamily: 'TheSansOffice',
        // AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 102, 197, 48),
        ),
        /*
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 78, 90, 92)
        ),
         */
        textTheme: TextTheme(
          // schwarzer Text
          bodyText1: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          // grauer Text
          bodyText2: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 78, 90, 92),
          ),
          // Zeit
          subtitle1: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          // Default-Nachricht
          subtitle2: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 220, 220, 220),
          ),
          headline2: TextStyle(
            fontSize: 23,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}

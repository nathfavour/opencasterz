import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cast_screen.dart';

void main() {
  runApp(OpenCasterzApp());
}

class OpenCasterzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenCasterz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cast': (context) => CastScreen(),
      },
    );
  }
}

import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //home: LoadingScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/location': (context) => LocationScreen(),
        '/city': (context) => CityScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:workout/route_generator.dart';
import 'package:workout/screens/onboardScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute:RouteGenerator.generateRoute,
    );
  }
}

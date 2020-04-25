import 'package:flutter/material.dart';
import 'package:workout/screens/excerciseScreen.dart';
import 'package:workout/screens/onboardScreen.dart';
import 'package:workout/screens/selectedExerciseScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name){
      case '/' :
        return MaterialPageRoute(builder: (_)=>OnBoardScreen());
      case '/SelectedExerise':
        if(args is List)
          {
            return MaterialPageRoute(
              builder:(_)=>SelectedExercise(data: args,)
            );
          }
        else{
          return MaterialPageRoute(builder: (_) => SelectedExercise());

        }

        return _errorRoute();
        case '/ExerciseScreen':
        if(args is List)
          {
            return MaterialPageRoute(
              builder:(_)=>ExerciseScreen(data: args,)
            );
          }
        else{
          return MaterialPageRoute(builder: (_) => ExerciseScreen());

        }

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
return MaterialPageRoute(builder: (_){
  return Scaffold(
    appBar: AppBar(title: Text('Error'),),
    body: Center(
      child: Text('Error'),
    ),
  );
});
  }
}

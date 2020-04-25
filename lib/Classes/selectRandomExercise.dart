import 'dart:math';
import 'package:workout/Classes/Exercises.dart';

class RandomExercise {
  List<Exercises> selectedExercises = [];
  List<Exercises> _exerciseList = [
    Exercises(
        'Squats',
        'assets/exerciseImages/squats.png',
        1,
        "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent of a squat, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up.",
        "assets/gym4.mp3"),
    Exercises(
        'Crunch',
        'assets/exerciseImages/crunch.png',
        1,
        "The crunch is one of the most popular abdominal exercises. It involves the entire abs, but primarily it works the rectus abdominis muscle and also works the obliques. It allows both building six-pack abs, and tightening the belly.",
        "assets/gym1.mp3"),
    Exercises(
        'Jumping jack',
        'assets/exerciseImages/jumpingjack.png',
        1,
        "Jumpinh Jack is a physical jumping exercise performed by jumping to a position with the legs spread wide and the hands going overhead, sometimes in a clap, and then returning to a position with the feet together and the arms at the sides.",
        "assets/gym2.mp3"),
    Exercises(
        'Push Up',
        'assets/exerciseImages/pushup.png',
        1,
        "A push-up is a common calisthenics exercise beginning from the prone position. By raising and lowering the body using the arms, push-ups exercise the pectoral muscles, triceps, and anterior deltoids.",
        "assets/gym3.mp3"),
    Exercises(
        'Air Swimming',
        'assets/exerciseImages/pushup.png',
        1,
        "Air Swimming is excellent for targeting your posterior chain (or the backside of your body), and that's important for improving posture, preventing back pain, and making sure you have balanced strength—which is a major key to healthy overall movement, both in and out of a gym.",
        "assets/gym4 .mp3"),

  ];

  RandomExercise() {
    selectRandomExercise();
  }

  //logic to choose 5 random unique exercises from the list
  selectRandomExercise() {
    List<Exercises> removedList = []..addAll(_exerciseList);
    for (var i = 0; i < 5; i++) {
      int x = Random().nextInt(removedList.length);
      selectedExercises.add(removedList[x]);
      removedList.removeAt(x);
    }
  }

  List<Exercises> getRandomExercises() {
    return selectedExercises;
  }

  String getImage(int i) {
    return selectedExercises[i].exerciseImage;
  }

  List<Exercises> getAllExercises() {
    return _exerciseList;
  }

  int getlength() {
    return _exerciseList.length;
  }
}

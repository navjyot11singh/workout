import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:workout/Classes/Exercises.dart';

class ExerciseScreen extends StatefulWidget {
  final List<Exercises> data;

  ExerciseScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  Timer _timer;
  int _start;
  int _exerciseNo = 0;

  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    _start = widget.data[_exerciseNo].durationMinutes * 60;
    if (_start == 0) initPlayer();
    playSound();
    startTimer();
    super.initState();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }

  void playSound() {
    if (_start <= widget.data[_exerciseNo].durationMinutes * 60 && _start > 0) {
      audioCache.play(widget.data[_exerciseNo].song);
    }
  }

  void stopSound() {
    advancedPlayer.stop();
    advancedPlayer.release();
    advancedPlayer.dispose();
    audioCache.clearCache();
  }

  void nextExercise() {
    setState(() {
      if (_exerciseNo >= 0 && _exerciseNo <= 3) {
        _exerciseNo++;
        initState();
      }
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                timer.cancel();
                stopSound();
                nextExercise();
              } else {
                _start = _start - 1;
              }
            }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFF262640),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipPath(
                        clipper: ImageClipper(),
                        child: Image(
                          height: MediaQuery.of(context).size.height / 2,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.data[_exerciseNo].exerciseImage,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: 25,
                                  right: 20,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'Exercise',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.3),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 25,
                                  right: 20,
                                  bottom: 10,
                                ),
                                child: Text(
                                  widget.data[_exerciseNo].exerciseName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _start.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 25,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          widget.data[_exerciseNo].description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 25, bottom: 25),
                      child: Text(
                        'Go to next exercise',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 25),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, bottom: 20),
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                        color: Color(0xFF747485).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

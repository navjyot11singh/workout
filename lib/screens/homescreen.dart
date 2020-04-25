import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:workout/Classes/selectRandomExercise.dart';
import 'package:workout/screens/selectedExerciseScreen.dart';

class HomeScreen extends StatelessWidget {
  RandomExercise randomExercise = new RandomExercise();

  String getTextCard() {
    String x = "";
    int len = randomExercise.getRandomExercises().length;
    for (int i = 0; i < len; i++) {
      i == (len - 1)
          ? x += randomExercise.getRandomExercises()[i].exerciseName
          : x += randomExercise.getRandomExercises()[i].exerciseName + ", ";
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Workouts",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //Container for line
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey.shade200,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              Container(
                height: 270,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,'/SelectedExerise',arguments :randomExercise.getRandomExercises()
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(16),
                    color: Color(0xFF262640),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'YOUR RANDOM WORKOUT SELECTED',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade200.withOpacity(0.5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            getTextCard(),
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                itemCount:
                                    randomExercise.getRandomExercises().length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Color(0xFF515166),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        randomExercise
                                            .getRandomExercises()[index]
                                            .exerciseImage,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  );
                                },
                                //map List of our data to the ListView
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Workout Options",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.indigo[400]),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: randomExercise.getAllExercises().length,
                    itemBuilder: (context, index1) {
                      return Container(
                        height: 100,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(randomExercise
                                .getAllExercises()[index1]
                                .exerciseName),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Collection",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.indigo[400]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/exerciseImages/squats.png')),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color(0xFFC6C6CD),
                        ),
                        child: Image.asset(
                          'assets/exerciseImage/squats.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Push Workout',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Set of exercises focused on push',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/exerciseImages/squats.png')),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color(0xFFC6C6CD),
                        ),
                        child: Image.asset(
                          'assets/exerciseImage/squats.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Push Workout',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Set of exercises focused on push',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

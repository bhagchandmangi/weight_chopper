import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List<bool> days = [false, false, false, false, false, false, false];
  Color selectedBgColor = Colors.blue;
  Color selectedTextColor = Colors.white;
  Color unSelectedBgColor = Colors.grey[300]!;
  Color unSelectedTextColor = Colors.black;
  // ignore: unused_field
  final CountDownController _controller = CountDownController();
  final int _duration = 10;

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double heightOfBottomBar = MediaQuery.of(context).size.height * 0.07;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        SizedBox(
          height: AppBar().preferredSize.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.menu, color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height - (AppBar().preferredSize.height + heightOfBottomBar),
          //margin: EdgeInsets.only(top: AppBar().preferredSize.height),
          child: ListView(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.30,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/fav.png',
                        fit: BoxFit.cover,
                        height: height * 0.3,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Set 1",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                  Text(
                    "Walk",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: CircularCountDownTimer(
                  duration: _duration,
                  initialDuration: 1,
                  controller: CountDownController(),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  ringColor: Colors.grey[300]!,
                  ringGradient: null,
                  fillColor: Colors.blue,
                  fillGradient: null,
                  backgroundGradient: null,
                  strokeWidth: 5.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isReverse: false,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    print('Countdown Ended');
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Keep going almost done",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/3.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Next 2/6",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Sprint",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "2 meter",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ])),
    );
  }
}

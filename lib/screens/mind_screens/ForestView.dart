import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';

class ForestView extends StatefulWidget {
  const ForestView({Key? key}) : super(key: key);

  @override
  _ForestViewState createState() => _ForestViewState();
}

class _ForestViewState extends State<ForestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/forest.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null /* add child content here */,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // var route = MaterialPageRoute(
                      //     builder: (context) => CognitiveTherapy());
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MySize.size20!, top: MySize.size20!),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Expanded(child: Container()),
                  // SizedBox(height: MySize.size10),
                  Container(
                    padding: EdgeInsets.only(
                        left: MySize.size80!, top: MySize.size20!),
                    child: DDText(
                        title: "Cognitive Behavior Therapy",
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DDText(
                    title: "Forest Vibe",
                    color: Colors.white,
                    weight: FontWeight.bold,
                    size: 25,
                  ),
                  SizedBox(
                    height: MySize.size50,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    icon: const Icon(Icons.pause),
                    label: const Text("Pause"),
                  ),
                  SizedBox(height: MySize.size10),
                  DDText(title: "00:49", color: Colors.white)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

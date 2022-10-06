import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';

import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietTabView.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/RunningTab.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/SearchFood.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/SummaryScreen.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MindTabView.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/CheatFoodScreen.dart';
import 'package:weightchopper_flutter_project/utils/ColorConfig.dart';
import 'package:weightchopper_flutter_project/utils/Responsive.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';
import 'package:weightchopper_flutter_project/widget/SizeConfig.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({
    Key? key,
    this.responsive,
    this.colors,
  }) : super(key: key);

  final Responsive? responsive;
  final ColorConfig? colors;

  @override
  _DiaryViewState createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: customAppBar(
          context,
          elevation: 0.5,
          tabBar: TabBar(
            labelPadding: EdgeInsets.only(left: MySize.size4!),
            indicatorColor: const Color(0xff4885ED),
            labelColor: const Color(0xff4885ED),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black87,
            tabs: const [
              Tab(
                text: 'Today',
              ),
              Tab(text: 'Diet'),
              Tab(text: 'Exercise'),
              Tab(text: 'Mind'),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: TabBarView(
                        children: [
                          diaryBody(context),
                          const DietTabView(),
                          const RunningTabView(),
                          const MindTabView(),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView diaryBody(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: MySize.size26!),
                child: DDText(
                  title: "Budget",
                  weight: FontWeight.w500,
                  size: MySize.size14!,
                ),
              ),
              GestureDetector(
                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (context) => const CheatFoodScreen(),
                  );
                  Navigator.push(context, route);
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/cheeseburger.png",
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: MySize.size26!),
                      child: DDText(
                        title: "Cheat Food",
                        weight: FontWeight.w500,
                        size: MySize.size14!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 1,
          ),
          goalFoodExerciseCaloriesLeftSection(),
          SizedBox(
            height: MySize.size30,
          ),
          diaryPart(context),
          SizedBox(
            height: MySize.size16!,
          ),
          Container(
              margin:
                  EdgeInsets.only(left: MySize.size18!, right: MySize.size20!),
              child: const Divider(
                thickness: 0.5,
              )),
          tabBarTabs(),
          Container(
            margin:
                EdgeInsets.only(left: MySize.size18!, right: MySize.size20!),
            child: const Divider(
              thickness: 0.3,
            ),
          ),
          tabBarView(),
          addButton(context)
        ],
      ),
    );
  }

// #################### ADD FOOD BUTTON #####################

  Row addButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4C86EC),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              print("pressed");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchFood();
              }));
            },
            child: Text(
              "Add",
              style: TextStyle(fontSize: MySize.size14!),
            ))
      ],
    );
  }

// #################### TAB BAR TABS #####################

  Container tabBarTabs() {
    return Container(
      margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size8),
      child: DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Center(
          child: Container(
            // padding:
            // EdgeInsets.symmetric(horizontal: MySize.size22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  color: Colors.white,
                  child: TabBar(
                    indicatorColor: primaryColor,
                    unselectedLabelColor: Colors.black,
                    labelPadding: const EdgeInsets.only(
                      left: 2,
                      right: 2,
                    ),
                    labelStyle: TextStyle(fontSize: MySize.size12!),
                    tabs: const [
                      Tab(
                        text: "Breakfast",
                      ),
                      Tab(
                        text: "Lunch",
                      ),
                      Tab(
                        text: "Dinner",
                      ),
                      Tab(
                        text: "Snacks",
                      ),
                      Tab(
                        text: "Exercise",
                      ),
                      Tab(
                        text: "Water",
                      ),
                    ],
                    labelColor: primaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// #################### TAB BAR VIEW #####################

  Container tabBarView() {
    return Container(
      margin: EdgeInsets.only(left: MySize.size8, right: MySize.size8),
      child: Card(
        elevation: 0.3,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //     side: BorderSide(
        //         style: BorderStyle.solid,
        //         color: Colors.transparent)),
        // elevation: 0.5,
        margin: EdgeInsets.only(
            left: MySize.size12!,
            right: MySize.size12!,
            bottom: MySize.size6,
            top: MySize.size8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MySize.size14!,
                // top: MySize.size8,
              ),
              child: Row(
                children: [
                  Text("Salad 250g",
                      style: TextStyle(fontSize: MySize.size14!)),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(right: MySize.size14!),
                    child: Text("320cal",
                        style: TextStyle(fontSize: MySize.size14!)),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MySize.size14!,
                // top: MySize.size8,
              ),
              child: Row(
                children: [
                  Text("Egg1", style: TextStyle(fontSize: MySize.size14!)),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(right: MySize.size14!),
                    child: Text("120cal",
                        style: TextStyle(fontSize: MySize.size14!)),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MySize.size14!,
                top: MySize.size8,
                bottom: MySize.size8,
              ),
              child: Row(
                children: [
                  Text("Milk 120ml",
                      style: TextStyle(fontSize: MySize.size14!)),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(right: MySize.size14!),
                    child: Text("320cal",
                        style: TextStyle(fontSize: MySize.size14!)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// #################### DIARY VIEW #####################

  GestureDetector diaryPart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SummaryScreen();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/diary.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(
                left: MySize.size26!,
                top: MySize.size14!,
                bottom: MySize.size14!,
                right: MySize.size18!),
            // color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          // padding: EdgeInsets.only(
                          //     left: MySize.size26!,
                          //     top: MySize.size14!,
                          //     bottom: MySize.size14!,
                          //     right: MySize.size18!),
                          // color: Colors.red,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(
                                //     left: MySize.size26!,
                                //     top: MySize.size14!,
                                //     bottom: MySize.size14!,
                                //     right: MySize.size18!),
                                child: Icon(
                                  Icons.free_breakfast_outlined,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MySize.size10!),
                                child: Text(
                                  "Breakfast",
                                  style: TextStyle(fontSize: MySize.size14!),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(""),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "200cals",
                        style: TextStyle(fontSize: MySize.size14!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MySize.size26!,
                top: MySize.size14!,
                bottom: MySize.size14!,
                right: MySize.size18!),
            // color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          // padding: EdgeInsets.only(
                          //     left: MySize.size26!,
                          //     top: MySize.size14!,
                          //     bottom: MySize.size14!,
                          //     right: MySize.size18!),
                          // color: Colors.red,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(
                                //     left: MySize.size26!,
                                //     top: MySize.size14!,
                                //     bottom: MySize.size14!,
                                //     right: MySize.size18!),
                                child: Icon(
                                  Icons.lunch_dining_outlined,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MySize.size10!),
                                child: Text(
                                  "Lunch",
                                  style: TextStyle(fontSize: MySize.size14!),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(""),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "200cals",
                        style: TextStyle(fontSize: MySize.size14!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MySize.size26!,
                top: MySize.size14!,
                bottom: MySize.size14!,
                right: MySize.size18!),
            // color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          // padding: EdgeInsets.only(
                          //     left: MySize.size26!,
                          //     top: MySize.size14!,
                          //     bottom: MySize.size14!,
                          //     right: MySize.size18!),
                          // color: Colors.red,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(
                                //     left: MySize.size26!,
                                //     top: MySize.size14!,
                                //     bottom: MySize.size14!,
                                //     right: MySize.size18!),
                                child: Icon(
                                  MdiIcons.silverwareVariant,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MySize.size10!),
                                child: Text(
                                  "Dinner",
                                  style: TextStyle(fontSize: MySize.size14!),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(""),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "200cals",
                        style: TextStyle(fontSize: MySize.size14!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MySize.size26!,
                top: MySize.size14!,
                bottom: MySize.size14!,
                right: MySize.size18!),
            // color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          // padding: EdgeInsets.only(
                          //     left: MySize.size26!,
                          //     top: MySize.size14!,
                          //     bottom: MySize.size14!,
                          //     right: MySize.size18!),
                          // color: Colors.red,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(
                                //     left: MySize.size26!,
                                //     top: MySize.size14!,
                                //     bottom: MySize.size14!,
                                //     right: MySize.size18!),
                                child: Icon(
                                  MdiIcons.cookieOutline,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MySize.size10!),
                                child: Text(
                                  "Snacks",
                                  style: TextStyle(fontSize: MySize.size14!),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(""),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "200cals",
                        style: TextStyle(fontSize: MySize.size14!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MySize.size26!,
                top: MySize.size14!,
                bottom: MySize.size14!,
                right: MySize.size18!),
            // color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          // padding: EdgeInsets.only(
                          //     left: MySize.size26!,
                          //     top: MySize.size14!,
                          //     bottom: MySize.size14!,
                          //     right: MySize.size18!),
                          // color: Colors.red,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(
                                //     left: MySize.size26!,
                                //     top: MySize.size14!,
                                //     bottom: MySize.size14!,
                                //     right: MySize.size18!),
                                child: Icon(
                                  Icons.water,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MySize.size10!),
                                child: Text(
                                  "Water",
                                  style: TextStyle(fontSize: MySize.size14!),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(""),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "200cals",
                        style: TextStyle(fontSize: MySize.size14!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

// #################### GOAL, FOOD, EXERCISE AND CALORIES LEFT VIEW #####################

  Padding goalFoodExerciseCaloriesLeftSection() {
    return Padding(
      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size20!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DDText(
                    title: "Goal",
                    size: MySize.size15,
                    weight: FontWeight.w500,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Countup(
                        begin: 0,
                        end: 1100,
                        duration: const Duration(seconds: 1),
                        separator: ',',
                        style: GoogleFonts.openSans(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10!),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size20!),
                    width: MySize.size50,
                    child: const StepProgressIndicator(
                      totalSteps: 100,
                      direction: Axis.horizontal,
                      currentStep: 100,
                      padding: 0,
                      selectedColor: primaryColor,
                      unselectedColor: Colors.black12,
                      progressDirection: TextDirection.ltr,
                      //selectedSize: 10.0,
                      // roundedEdges: Radius.elliptical(6, 30),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: MySize.size10!),
                    child: Image.asset("assets/icons/plus.png"),
                  ),
                  const Text("")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  DDText(
                    title: "Food",
                    size: MySize.size15,
                  ),
                  Countup(
                    begin: 0,
                    end: 300,
                    duration: const Duration(seconds: 1),
                    separator: ',',
                    style: GoogleFonts.openSans(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: MySize.size10!),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size20!),
                    width: MySize.size50,
                    child: const StepProgressIndicator(
                      totalSteps: 100,
                      direction: Axis.horizontal,
                      currentStep: 80,
                      padding: 0,
                      selectedColor: primaryColor,
                      unselectedColor: Colors.black12,
                      progressDirection: TextDirection.ltr,
                      //selectedSize: 10.0,
                      // roundedEdges: Radius.elliptical(6, 30),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size10!,
                        left: MySize.size2!,
                        right: MySize.size8),
                    child: Image.asset("assets/icons/minus.png"),
                  ),
                  const Text("")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  DDText(
                    title: "Exercise",
                    size: MySize.size15,
                  ),
                  Countup(
                    begin: 0,
                    end: 300,
                    duration: const Duration(seconds: 1),
                    separator: ',',
                    style: GoogleFonts.openSans(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: MySize.size10!),
                  SizedBox(
                    width: MySize.size50,
                    child: const StepProgressIndicator(
                      totalSteps: 100,
                      direction: Axis.horizontal,
                      currentStep: 20,
                      padding: 0,
                      selectedColor: primaryColor,
                      unselectedColor: Colors.black12,
                      progressDirection: TextDirection.ltr,
                      //selectedSize: 10.0,
                      // roundedEdges: Radius.elliptical(6, 30),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size10!, left: MySize.size10!),
                    child: DDText(
                      title: "=",
                      size: MySize.size18!,
                    ),
                  ),
                  const Text("")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  DDText(
                    title: "Calories Left",
                    size: MySize.size15,
                  ),
                  Countup(
                    begin: 0,
                    end: 1000,
                    duration: const Duration(seconds: 1),
                    separator: ',',
                    style: GoogleFonts.openSans(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MySize.size10!,
                      ),
                      SizedBox(
                        // margin:
                        //     EdgeInsets.only(
                        //         right: MySize
                        //             .size34),
                        width: MySize.size50,
                        child: const StepProgressIndicator(
                          totalSteps: 100,
                          direction: Axis.horizontal,
                          currentStep: 50,
                          padding: 0,
                          selectedColor: primaryColor,
                          unselectedColor: Colors.black12,
                          progressDirection: TextDirection.ltr,
                          //selectedSize: 10.0,
                          // roundedEdges: Radius.elliptical(6, 30),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

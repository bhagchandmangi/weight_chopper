import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/CheatFoodRedeemScreen.dart';

import 'package:weightchopper_flutter_project/screens/mind_screens/MeditationView.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';

import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class CheatFoodScreen extends StatefulWidget {
  const CheatFoodScreen({Key? key}) : super(key: key);

  @override
  _CheatFoodScreenState createState() => _CheatFoodScreenState();
}

class _CheatFoodScreenState extends State<CheatFoodScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Today',
    ),
    const Tab(text: 'Diet'),
    const Tab(text: 'Exercise'),
    const Tab(text: 'Mind'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController!.animateTo(2);
  }

  // @override
  // void dispose() {
  //   _tabController!.dispose();
  //   super.dispose();
  // }

  List<bool> days = [false, false, false, false, false, false, false];
  Color selectedBgColor = Colors.blue;
  Color selectedTextColor = Colors.white;
  Color unSelectedBgColor = Colors.grey[100]!;
  Color unSelectedTextColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // double heightOfTabBar = MediaQuery.of(context).size.height * 0.04;
    // double heightOfBottomBar = MediaQuery.of(context).size.height * 0.07;
    double margin = height * 0.02;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
        drawer: const CustomDrawer(),
        appBar: customAppBar(
          context,
          elevation: 0.5,
          tabBar: TabBar(
            onTap: (index) {
              setState(() {
                _tabController!.index = 2;
              });
            },
            controller: _tabController!,
            labelPadding: EdgeInsets.only(left: MySize.size4!),
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black87,
            tabs: myTabs,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(children: [
            SizedBox(
              height: MySize.size10,
            ),
            searchFieldandRedeemButtonSection(),
            daysRowLatest(margin, height),
            const SizedBox(height: 20),
            goalFoodExerciseCaloriesLeftSection(),
            SizedBox(height: MySize.size20!),
            const Divider(),
            SizedBox(height: MySize.size10),
            headingView("Tracking", MySize.size14!),
            bannerSection(context),
            SizedBox(height: MySize.size20!),
            headingView("Recommended", MySize.size0),
            gridSection(context),
          ]),
        ),
      ),
    );
  }

  Widget daysRowLatest(double margin, double height) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          margin: EdgeInsets.only(top: margin, left: margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  for (int i = 0; i < days.length; i++) {
                    setState(() {
                      days[i] = false;
                    });
                  }
                  setState(() {
                    days[0] = true;
                  });
                },
                child: dayNumberLatest(height, "1", 0),
              ),
              InkWell(
                  onTap: () {
                    for (int i = 0; i < days.length; i++) {
                      setState(() {
                        days[i] = false;
                      });
                    }
                    setState(() {
                      days[1] = true;
                    });
                  },
                  child: dayNumberLatest(height, "2", 1)),
              InkWell(
                  onTap: () {
                    for (int i = 0; i < days.length; i++) {
                      setState(() {
                        days[i] = false;
                      });
                    }
                    setState(() {
                      days[2] = true;
                    });
                  },
                  child: dayNumberLatest(height, "3", 2)),
              InkWell(
                  onTap: () {
                    for (int i = 0; i < days.length; i++) {
                      setState(() {
                        days[i] = false;
                      });
                    }
                    setState(() {
                      days[3] = true;
                    });
                  },
                  child: dayNumberLatest(height, "4", 3)),
              InkWell(
                  onTap: () {
                    for (int i = 0; i < days.length; i++) {
                      setState(() {
                        days[i] = false;
                      });
                    }
                    setState(() {
                      days[4] = true;
                    });
                  },
                  child: dayNumberLatest(height, "5", 4)),
              InkWell(
                  onTap: () {
                    for (int i = 0; i < days.length; i++) {
                      setState(() {
                        days[i] = false;
                      });
                    }
                    setState(() {
                      days[5] = true;
                    });
                  },
                  child: dayNumberLatest(height, "6", 5)),
              InkWell(
                  onTap: () {
                    for (int i = 0; i < days.length; i++) {
                      setState(() {
                        days[i] = false;
                      });
                    }
                    setState(() {
                      days[6] = true;
                    });
                  },
                  child: dayNumberLatest(height, "7", 6)),
            ],
          )),
    );
  }

  Widget dayNumberLatest(double height, number, index) {
    return Container(
      padding: EdgeInsets.only(
        top: MySize.size4!,
        bottom: MySize.size4!,
        right: MySize.size7!,
        left: MySize.size7!,
      ),
      // padding: EdgeInsets.fromLTRB(height * 0.001,
      //     height * 0.018, height * 0.002, height * 0.015),
      margin: EdgeInsets.only(
        right: height * 0.0242,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: days[index] ? selectedBgColor : unSelectedBgColor),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DDText(
              title: "Day",
              size: 11,
              weight: FontWeight.w300,
              color: days[index] ? selectedTextColor : unSelectedTextColor,
            ),
            DDText(
              title: number,
              size: 11,
              weight: FontWeight.w300,
              color: days[index] ? selectedTextColor : unSelectedTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Row searchFieldandRedeemButtonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: MySize.size63,
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffdfdfdf),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffdfdfdf),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: const Icon(
                    Icons.search,
                    color: Color(0xffafafaf),
                  ),
                ),
                contentPadding: const EdgeInsets.only(bottom: 4),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Color(0xffdfdfdf),
                    )),
                // filled: true,
                hintStyle: GoogleFonts.openSans(
                  fontSize: MySize.size12!,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
                hintText: "Search..",
                fillColor: Colors.white70,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: MySize.size4!),
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xffF4B400))),
            child: Row(
              children: [
                Image.asset("assets/icons/c_icon_blue.png"),
                DDText(
                  title: " 800",
                  weight: FontWeight.w600,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: DDText(
                    title: " cal",
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(
            right: MySize.size4!,
          ),
          height: MySize.size40!,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
            ],
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                Color(0xffF4B400),
                Color(0xffFC7922),
              ],
            ),
            // color: Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              // minimumSize: MaterialStateProperty.all(Size(width, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              // elevation: MaterialStateProperty.all(3),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              var route = MaterialPageRoute(
                  builder: (context) => const CheatFoodRedeem());
              Navigator.push(context, route);
            },
            child: DDText(
              title: "Redeem",
              color: Colors.white,
            ),
          ),
        ))
      ],
    );
  }

  Widget bannerSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MySize.size4!, right: MySize.size12!),
      width: MediaQuery.of(context).size.width,
      // height: height * 0.26,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: MySize.size10!),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                child: Image.asset(
                  'assets/images/cheat_food_1.png',
                  fit: BoxFit.cover,
                  // height: height * 0.3,
                  // width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (context) => const MeditationViewMind());
                Navigator.push(context, route);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MySize.size14!, left: MySize.size20!),
                        child: DDText(
                          title: "Pizza",
                          color: Colors.white,
                          weight: FontWeight.bold,
                          size: MySize.size15,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size14!, right: MySize.size2!),
                            child: Image.asset(
                              "assets/icons/c-icon.png",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size14!, right: MySize.size2!),
                            child: DDText(
                              title: "1200",
                              color: Colors.white,
                              weight: FontWeight.bold,
                              size: MySize.size15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size14!, right: MySize.size20!),
                            child: DDText(
                              title: "cal",
                              color: Colors.white,
                              weight: FontWeight.w500,
                              size: MySize.size15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.transparent),
                  Container(
                    padding: EdgeInsets.only(left: MySize.size26!),
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //     bottom: BorderSide(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DDText(
                            title: "You have",
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(
                            width: MySize.size96,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: DDText(
                              title: "800 cal",
                              color: Colors.white,
                              weight: FontWeight.w600,
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MySize.size50!,
                      right: MySize.size160!,
                    ),
                    child: Divider(
                      thickness: 2.5,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: MySize.size20!,
                      left: MySize.size20!,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DDText(
                                title: 'Calories to go',
                                size: MySize.size12!,
                                color: Colors.white,
                                weight: FontWeight.w600,
                              ),
                              DDText(
                                title: '127cal',
                                size: MySize.size12!,
                                color: Colors.white,
                                weight: FontWeight.w600,
                              ),
                              Countup(
                                begin: 0,
                                end: 65,
                                suffix: "%",
                                style: GoogleFonts.openSans(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              // (
                              //   "45%",
                              //   style: style.copyWith(
                              //       fontSize: 13,
                              //       color: Color(0xff0271BB),
                              //       fontWeight: FontWeight.w600),
                              // ),
                            ],
                          ),
                        ),
                        LinearPercentIndicator(
                          backgroundColor: Colors.black,
                          // width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 8.0,
                          animationDuration: 1000,
                          percent: 0.65,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container headingView(title, bottomPadding) {
    return Container(
      padding: EdgeInsets.only(left: MySize.size16!, bottom: bottomPadding),
      child: Row(
        children: [
          DDText(
            title: title,
            size: MySize.size11,
          ),
        ],
      ),
    );
  }

  Widget gridSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MySize.size10!, left: MySize.size10!),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return MeditationViewMind();
                          // }));
                        },
                        child: Image.asset(
                          'assets/images/cheat_food_2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                    title: "Cream Pasta",
                                    size: MySize.size11,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.copyright,
                                        color: primaryColor,
                                        size: MySize.size11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: DDText(
                                        title: "800 cal",
                                        size: 10,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MySize.size2!, top: MySize.size4!),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         RunningTabInnerPage(),
                          //   ),
                          // );
                        },
                        child: Image.asset(
                          'assets/images/cheat_food_3.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                    title: "Ham Burger",
                                    size: MySize.size11,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.copyright,
                                        color: primaryColor,
                                        size: MySize.size11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: DDText(
                                        title: "800 cal",
                                        size: 10,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MySize.size2!, top: MySize.size4!),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         RunningTabInnerPage(),
                          //   ),
                          // );
                        },
                        child: Image.asset(
                          'assets/images/cheat_food_4.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                    title: "Icecream",
                                    size: MySize.size11,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.copyright,
                                        color: primaryColor,
                                        size: MySize.size11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: DDText(
                                        title: "800 cal",
                                        size: 10,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MySize.size2!, top: MySize.size4!),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return MeditationViewMind();
                          // }));
                        },
                        child: Image.asset(
                          'assets/images/cheat_food_5.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                    title: "Cake",
                                    size: MySize.size11,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.copyright,
                                        color: primaryColor,
                                        size: MySize.size11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: DDText(
                                        title: "800 cal",
                                        size: 10,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MySize.size2!, top: MySize.size4!),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         RunningTabInnerPage(),
                          //   ),
                          // );
                        },
                        child: Image.asset(
                          'assets/images/cheat_food_6.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                    title: "Fries",
                                    size: MySize.size11,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.copyright,
                                        color: primaryColor,
                                        size: MySize.size11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: DDText(
                                        title: "800 cal",
                                        size: 10,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MySize.size2!, top: MySize.size4!),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         RunningTabInnerPage(),
                          //   ),
                          // );
                        },
                        child: Image.asset(
                          'assets/images/cheat_food_7.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                    title: "Icecream",
                                    size: MySize.size11,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.copyright,
                                        color: primaryColor,
                                        size: MySize.size11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: DDText(
                                        title: "800 cal",
                                        size: 10,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MySize.size2!, top: MySize.size4!),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget daysSection(double margin, double height) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: MySize.size14!, top: MySize.size10!),
            // margin: EdgeInsets.all(margin),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[0] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.001,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[0] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[0]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[0]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[1] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.005,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[1] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[1]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[1]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[2] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.005,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[2] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[2]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[2]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[3] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.005,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[3] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[3]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[3]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[4] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.005,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[4] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[4]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[4]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[5] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.005,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[5] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[5]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "6",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[5]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < days.length; i++) {
                        setState(() {
                          days[i] = false;
                        });
                      }
                      setState(() {
                        days[6] = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(height * 0.005,
                          height * 0.015, height * 0.005, height * 0.015),
                      margin: EdgeInsets.only(right: height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: days[6] ? selectedBgColor : unSelectedBgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[6]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                          Text(
                            "7",
                            style: TextStyle(
                                fontSize: 11,
                                color: days[6]
                                    ? selectedTextColor
                                    : unSelectedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget goalFoodExerciseCaloriesLeftSection() {
    return Container(
      // color: Colors.blue,
      // padding: EdgeInsets.only(right: MySize.size20!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DDText(
                          title: "Food",
                          size: MySize.size15,
                        ),
                        Container(
                          // padding: EdgeInsets.only(left: MySize.size8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Countup(
                                begin: 0,
                                end: 300,
                                duration: const Duration(seconds: 1),
                                separator: ',',
                                style: GoogleFonts.openSans(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                              DDText(
                                title: " cal",
                                weight: FontWeight.w300,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.size10),
                    SizedBox(
                      // margin: EdgeInsets.only(left: MySize.size20!),
                      width: MySize.size36,
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
                SizedBox(
                  width: MySize.size30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: MySize.size10!,
                          left: MySize.size2!,
                          right: MySize.size8),
                      child: DDText(
                        title: "+",
                        size: MySize.size15,
                      ),
                    ),
                    const Text("")
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  DDText(
                    title: "Exercise",
                    size: MySize.size15,
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: MySize.size8),
                    child: Row(
                      children: [
                        Countup(
                          begin: 0,
                          end: 89,
                          duration: const Duration(seconds: 1),
                          separator: ',',
                          style: GoogleFonts.openSans(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        DDText(
                          title: " cal",
                          weight: FontWeight.w300,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.size10),
                  SizedBox(
                    width: MySize.size56,
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
              // Column(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(
              //           bottom: MySize.size10, left: MySize.size10),
              //       child: DDText(
              //         title: "",
              //         size: MySize.size18,
              //       ),
              //     ),
              //     Text("")
              //   ],
              // ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MySize.size10!,
                        left: MySize.size2!,
                        right: MySize.size8),
                    child: DDText(
                      title: "=",
                      size: MySize.size15,
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
                    title: "Calories Earned",
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
                        height: MySize.size10,
                      ),
                      SizedBox(
                        width: MySize.size110,
                        child: const StepProgressIndicator(
                          totalSteps: 100,
                          direction: Axis.horizontal,
                          currentStep: 50,
                          padding: 0,
                          selectedColor: primaryColor,
                          unselectedColor: Colors.black12,
                          progressDirection: TextDirection.ltr,
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

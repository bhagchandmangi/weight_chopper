import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';

import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class CheatFoodRedeem extends StatefulWidget {
  const CheatFoodRedeem({Key? key}) : super(key: key);

  @override
  _CheatFoodRedeemState createState() => _CheatFoodRedeemState();
}

class _CheatFoodRedeemState extends State<CheatFoodRedeem>
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

  // ignore: unused_element
  Future<void> _showFoodDialog({title, imageUrl, quantity, calories}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              insetAnimationDuration: const Duration(seconds: 1),
              insetAnimationCurve: Curves.fastOutSlowIn,
              elevation: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(imageUrl))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DDText(
                                    title: title,
                                    size: MySize.size11,
                                  ),
                                  SizedBox(height: MySize.size10),
                                  DDText(
                                    title: "You Have",
                                    size: MySize.size11,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.copyright,
                                        size: MySize.size11,
                                        color: primaryColor,
                                      ),
                                      DDText(
                                        title: calories,
                                        size: MySize.size11,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.copyright,
                                        size: MySize.size11,
                                        color: primaryColor,
                                      ),
                                      DDText(
                                        title: " 800 cal",
                                        size: MySize.size11,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: MySize.size4!,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                Color(0xffFC7922),
                                Color(0xffF4B400),
                              ],
                            ),
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/ios-lock.png"),
                                      SizedBox(height: MySize.size60),
                                      DDText(
                                          title: "You have redeemed your quota",
                                          size: MySize.size14,
                                          weight: FontWeight.bold,
                                          color: Colors.white),
                                      DDText(
                                          title: "of cheat food for this week",
                                          size: MySize.size14,
                                          weight: FontWeight.bold,
                                          color: Colors.white)
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18.0, horizontal: 20.0),
                              child: DDText(
                                title: "Redeem",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ignore: unused_element
  Future<void> _showLockDialog({title, imageUrl, quantity, calories}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              insetAnimationDuration: const Duration(seconds: 1),
              insetAnimationCurve: Curves.fastOutSlowIn,
              elevation: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(imageUrl))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DDText(
                                    title: title,
                                    size: MySize.size11,
                                  ),
                                  SizedBox(height: MySize.size10),
                                  DDText(
                                    title: "You have",
                                    size: MySize.size11,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.copyright,
                                        size: MySize.size11,
                                        color: primaryColor,
                                      ),
                                      DDText(
                                        title: calories,
                                        size: MySize.size11,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.copyright,
                                        size: MySize.size11,
                                        color: primaryColor,
                                      ),
                                      DDText(
                                        title: "800 cal",
                                        size: MySize.size11,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: MySize.size4!,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                Color(0xffFC7922),
                                Color(0xffF4B400),
                              ],
                            ),
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: DDText(
                                title: "Redeem",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  List<bool> days = [false, false, false, false, false, false, false];
  Color selectedBgColor = Colors.blue;
  Color selectedTextColor = Colors.white;
  Color unSelectedBgColor = Colors.grey[300]!;
  Color unSelectedTextColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    // double heightOfTabBar = MediaQuery.of(context).size.height * 0.04;
    // double heightOfBottomBar = MediaQuery.of(context).size.height * 0.07;
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
            controller: _tabController,
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
            const SizedBox(height: 20),
            headingView("Tier 1", "10 ", "cal", "50 ", "cal", MySize.size0),

            gridSection(context),
            // daysSection(margin, height),
            // goalFoodExerciseCaloriesLeftSection(),
            SizedBox(height: MySize.size20),
            const Divider(),
            SizedBox(height: MySize.size20),

            headingView(
                "Tier 2  (Locked)", "60 ", "cal", "100 ", "cal", MySize.size0),
            // bannerSection(context),
            // SizedBox(height: MySize.size20),
            // headingView("Recommended", MySize.size0),

            gridSectionLocked(context),
          ]),
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
                  fontSize: MySize.size12,
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
            color: Colors.deepPurple.shade300,
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
            onPressed: () {},
            child: DDText(
              title: "Redeem",
              color: Colors.white,
            ),
          ),
        ))
      ],
    );
  }

  Container headingView(titleLeft, titleRightSection1Head, titleSection1Right,
      titleRightSection2Head, titleSection2Right, bottomPadding) {
    return Container(
      padding: EdgeInsets.only(
        left: MySize.size16!,
        bottom: bottomPadding,
        right: MySize.size16!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DDText(
            title: titleLeft,
            size: MySize.size11,
          ),
          Row(
            children: [
              DDText(
                title: titleRightSection1Head,
                size: MySize.size11,
              ),
              DDText(
                title: titleSection1Right,
                size: MySize.size11,
              ),
              const Text(" - "),
              DDText(
                title: titleRightSection2Head,
                size: MySize.size11,
              ),
              DDText(
                title: titleSection2Right,
                size: MySize.size11,
              ),
            ],
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
                          // setState(() {});
                          // // initialIndex = 0;
                          _showFoodDialog(
                            title: "Cream Pasta",
                            imageUrl: 'assets/images/cheat_food_2.png',
                            calories: " 100",
                          );
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
                                    size: MySize.size12,
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
                          _showFoodDialog(
                            title: "Ham Burger",
                            imageUrl: 'assets/images/cheat_food_3.png',
                            calories: "100",
                          );
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
                                    size: MySize.size12,
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
                          _showFoodDialog(
                            title: "Icecream",
                            imageUrl: 'assets/images/cheat_food_4.png',
                            calories: "100",
                          );
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
                                    size: MySize.size12,
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
                          // setState(() {});
                          // // initialIndex = 0;
                          _showFoodDialog(
                            title: "Cake",
                            imageUrl: 'assets/images/cheat_food_5.png',
                            calories: "100",
                          );
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
                                    size: MySize.size12,
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
                          _showFoodDialog(
                            title: "Fries",
                            imageUrl: 'assets/images/cheat_food_6.png',
                            calories: "100",
                          );
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
                                    size: MySize.size12,
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
              // Expanded(
              //   flex: 1,
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         GestureDetector(
              //           onTap: () {
              //             setState(() {});
              //             // initialIndex = 0;
              //             // Navigator.push(
              //             //   context,
              //             //   MaterialPageRoute(
              //             //     builder: (BuildContext context) =>
              //             //         RunningTabInnerPage(),
              //             //   ),
              //             // );
              //           },
              //           child: Image.asset(
              //             'assets/images/cheat_food_7.png',
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //         Container(
              //           margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   DDText(
              //                       title: "Icecream",
              //                       size: MySize.size11,
              //                       weight: FontWeight.w400,
              //                       color: Colors.black),
              //                   Row(
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.only(top: 5.0),
              //                         child: Icon(
              //                           Icons.copyright,
              //                           color: primaryColor,
              //                           size: MySize.size11,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.only(top: 5.0),
              //                         child: DDText(
              //                           title: "800 cal",
              //                           size: 10,
              //                           weight: FontWeight.w300,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //               Column(
              //                 children: [
              //                   Padding(
              //                     padding: EdgeInsets.only(
              //                         right: MySize.size2, top: MySize.size4!),
              //                     child: Icon(
              //                       Icons.add,
              //                       color: Colors.blue,
              //                       size: MySize.size24,
              //                     ),
              //                   )
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const Expanded(child: Text(""))
            ],
          ),
        ],
      ),
    );
  }

  Widget gridSectionLocked(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MySize.size10!, left: MySize.size10!),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
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
                              },
                              child: Image.asset(
                                'assets/images/cheat_food_2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DDText(
                                          title: "Cream Pasta",
                                          size: MySize.size11,
                                          weight: FontWeight.w400,
                                          color: Colors.black),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Icon(
                                              Icons.copyright,
                                              color: primaryColor,
                                              size: MySize.size11,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                            right: MySize.size2!,
                                            top: MySize.size4!),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(left: 2, right: 2),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5.0)),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/ios-lock.png",
                            width: 50,
                            height: 50,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
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
                              },
                              child: Image.asset(
                                'assets/images/cheat_food_3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DDText(
                                          title: "Ham Burger",
                                          size: MySize.size11,
                                          weight: FontWeight.w400,
                                          color: Colors.black),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Icon(
                                              Icons.copyright,
                                              color: primaryColor,
                                              size: MySize.size11,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                            right: MySize.size2!,
                                            top: MySize.size4!),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(left: 2, right: 2),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5.0)),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/ios-lock.png",
                            width: 50,
                            height: 50,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
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
                              },
                              child: Image.asset(
                                'assets/images/cheat_food_4.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DDText(
                                          title: "Icecream",
                                          size: MySize.size11,
                                          weight: FontWeight.w400,
                                          color: Colors.black),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Icon(
                                              Icons.copyright,
                                              color: primaryColor,
                                              size: MySize.size11,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                            right: MySize.size2!,
                                            top: MySize.size4!),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(left: 2, right: 2),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5.0)),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/ios-lock.png",
                            width: 50,
                            height: 50,
                          ))
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
                child: Container(
                  // margin: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
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
                              },
                              child: Image.asset(
                                'assets/images/cheat_food_5.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DDText(
                                          title: "Cake",
                                          size: MySize.size11,
                                          weight: FontWeight.w400,
                                          color: Colors.black),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Icon(
                                              Icons.copyright,
                                              color: primaryColor,
                                              size: MySize.size11,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                            right: MySize.size2!,
                                            top: MySize.size4!),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8, top: 8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5.0)),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/ios-lock.png",
                            width: 50,
                            height: 50,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
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
                              },
                              child: Image.asset(
                                'assets/images/cheat_food_6.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DDText(
                                          title: "Fries",
                                          size: MySize.size11,
                                          weight: FontWeight.w400,
                                          color: Colors.black),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Icon(
                                              Icons.copyright,
                                              color: primaryColor,
                                              size: MySize.size11,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                            right: MySize.size2!,
                                            top: MySize.size4!),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5.0)),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/ios-lock.png",
                            width: 50,
                            height: 50,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
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
                              },
                              child: Image.asset(
                                'assets/images/cheat_food_7.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DDText(
                                          title: "Icecream",
                                          size: MySize.size11,
                                          weight: FontWeight.w400,
                                          color: Colors.black),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Icon(
                                              Icons.copyright,
                                              color: primaryColor,
                                              size: MySize.size11,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                            right: MySize.size2!,
                                            top: MySize.size4!),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8, top: 8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5.0)),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/ios-lock.png",
                            width: 50,
                            height: 50,
                          ))
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
}

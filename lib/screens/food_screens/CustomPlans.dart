import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/CreateDietCustomPlan.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietInnerTab.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietMyPlans.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/ActiveRunning.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/CreateExerciseCustomPlan.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/GetUpGoUp.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/MyPlansExercise.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/CreateMeditationCustomPlan.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/PlansScreen.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class CustomPlans extends StatefulWidget {
  const CustomPlans({Key? key}) : super(key: key);

  @override
  _CustomPlansState createState() => _CustomPlansState();
}

class _CustomPlansState extends State<CustomPlans>
    with TickerProviderStateMixin {
  List<bool> days = [false, false, false, false, false, false, false];
  Color selectedBgColor = Colors.blue;
  Color selectedTextColor = Colors.white;
  Color unSelectedBgColor = Colors.grey[300]!;
  Color unSelectedTextColor = Colors.black;

  bool myDietisFavourite = false;
  bool myDietisAdded = false;

  bool myWorkoutisFavourite = false;
  bool myWorkoutisAdded = false;
  TabController? _controller;
  int? _activeTabIndex;
  void _setActiveTabIndex() {
    _activeTabIndex = _controller!.index;
    setState(() {});
    // print(_activeTabIndex);
  }

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
    _controller = TabController(vsync: this, length: 3);

    _controller!.addListener(_setActiveTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double heightOfTabBar = MediaQuery.of(context).size.height * 0.04;
    double heightOfBottomBar = MediaQuery.of(context).size.height * 0.07;
    double margin = height * 0.02;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: customAppBar(
          context,
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
        bottomNavigationBar: const CustomStaticBottomNavigationBar(
          heartColor: true,
        ),
        body: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.25,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                        child: Image.asset(
                          _activeTabIndex == 0
                              ? 'assets/images/custom_plan_diet.png'
                              : _activeTabIndex == 1
                                  ? 'assets/images/custom_plan_mind.png'
                                  : _activeTabIndex == 2
                                      ? "assets/images/custom_plan_workout.png"
                                      : 'assets/images/custom_plan_diet.png',
                          fit: BoxFit.cover,
                          height: height * 0.3,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            // _activeTabIndex == 0
                            //     ? 'Diet Programs'
                            //     : _activeTabIndex == 1
                            //         ? 'Meditation Programs'
                            //         : _activeTabIndex == 2
                            //             ? "Exercise Programs"
                            //             : 'Diet Programs',
                            "Custom Plans",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              _activeTabIndex == 0
                                  ? Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                      return const DietMyPlansView();
                                    }))
                                  : _activeTabIndex == 1
                                      ? Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                          return const MeditationMyPlansScreen();
                                        }))
                                      : _activeTabIndex == 2
                                          ? Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                              return const MyPlansExercise();
                                            }))
                                          : Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                              return const DietMyPlansView();
                                            }));
                            },
                            child: Text(
                              "My Plans",
                              style: TextStyle(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              _activeTabIndex == 0
                                  ? Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                      return const CreateDietCustomPlan();
                                    }))
                                  : _activeTabIndex == 1
                                      ? Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                          return const CreateMeditationCustomPlan();
                                        }))
                                      : _activeTabIndex == 2
                                          ? Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                              return const CreateExerciseCustomPlan();
                                            }))
                                          : Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                              return const CreateDietCustomPlan();
                                            }));
                            },
                            child: Text(
                              "Create custom plan",
                              style: TextStyle(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: heightOfTabBar,
                        child: TabBar(
                          controller: _controller,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 2.2, color: Colors.blue),
                            ),
                          ),
                          /*indicator:  UnderlineTabIndicator(
                            borderSide: BorderSide(width: 0.0,color: Colors.white),
                            insets: EdgeInsets.symmetric(horizontal:16.0)
                        ),*/
                          labelColor: Colors.blue,
                          labelStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(text: 'My Diets'),
                            Tab(text: 'Mind'),
                            Tab(text: 'My Workouts'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height -
                            (AppBar().preferredSize.height +
                                heightOfTabBar +
                                heightOfBottomBar),
                        child: TabBarView(
                          controller: _controller,
                          children: <Widget>[
                            //favourite diet tab
                            myDietSection(margin, height),
                            // Mind Tab View
                            mindSection(margin, height),

                            //favourite workout tab
                            myWorkoutsSection(margin, height),
                          ],
                        ),
                      )
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

  Widget leftRightheading({left, right}) {
    return Container(
      padding: EdgeInsets.only(
        // left: MySize.size2,
        right: MySize.size16!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: TextField(
              style: GoogleFonts.openSans(
                  fontSize: MySize.size15, color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: left,
                hintStyle: GoogleFonts.openSans(
                    fontSize: MySize.size15, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              style: GoogleFonts.openSans(
                  fontSize: MySize.size15, color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: right,
                hintStyle: GoogleFonts.openSans(
                    fontSize: MySize.size15, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container myWorkoutsSection(double margin, double height) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 0),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const GetUpGoUp(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/run1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Get Active",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "2 weeks",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ActiveRunning(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/run2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Active Running",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "4 weeks",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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
          ),
        ],
      ),
    );
  }

  Container mindSection(double margin, double height) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
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
                          },
                          child: Image.asset(
                            'assets/images/custom_plan_mind_1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Lorum",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "10 min",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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
                          },
                          child: Image.asset(
                            'assets/images/custom_plan_mind_2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Lorum",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "10 min",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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
          ),
        ],
      ),
    );
  }

  Container myDietSection(double margin, double height) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
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
                            // initialIndex = 1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const DietInnerTab(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/diet1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Keto Diet",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "2 weeks",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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
                            setState(() {
                              // initialIndex = 1;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const DietInnerTab()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/diet2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Keto Diet",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "4 weeks",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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
          ),
        ],
      ),
    );
  }
}

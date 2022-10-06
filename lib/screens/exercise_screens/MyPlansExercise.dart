import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietInnerTab.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/GetUpGoUp.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class MyPlansExercise extends StatefulWidget {
  const MyPlansExercise({Key? key}) : super(key: key);

  @override
  _MyPlansExerciseState createState() => _MyPlansExerciseState();
}

class _MyPlansExerciseState extends State<MyPlansExercise>
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

  @override
  Widget build(BuildContext context) {
    int? initialIndex;

    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
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
            indicatorColor: const Color(0xff4885ED),
            labelColor: const Color(0xff4885ED),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black87,
            tabs: myTabs,
          ),
        ),
        body: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.26,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/Running.png',
                        fit: BoxFit.cover,
                        height: height * 0.3,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "My Plans",
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Browse Plans",
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
              SizedBox(
                height: MySize.size20,
              ),
              headingView("Active Plan(s)", MySize.size0),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GetUpGoUp()));
                              },
                              child: Image.asset(
                                'assets/images/run3.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Get Up Go Up",
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
                    // Expanded(
                    // Expanded(
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
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
                    //             setState(() {
                    //               initialIndex = 1;
                    //             });
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (BuildContext context) =>
                    //                       DietInnerTab()),
                    //             );
                    //           },
                    //           child: Image.asset(
                    //             'assets/images/diet2.png',
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //         Container(
                    //           margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text("Keto Diet",
                    //                   style: TextStyle(
                    //                       fontSize: 12,
                    //                       fontWeight: FontWeight.w400,
                    //                       color: Colors.black)),
                    //               Padding(
                    //                 padding: const EdgeInsets.only(top: 5.0),
                    //                 child: Text(
                    //                   "4 weeks",
                    //                   style: TextStyle(
                    //                       color: Colors.grey,
                    //                       fontSize: 10,
                    //                       fontWeight: FontWeight.w300),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size20,
              ),
              headingView("Recent Plan(s)", MySize.size0),
              recentPlansGrid(initialIndex!, context),
            ],
          ),
        ),
      ),
    );
  }

  Container recentPlansGrid(int initialIndex, BuildContext context) {
    return Container(
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
                      // setState(() {});
                      // initialIndex = 1;
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => DietInnerTab(),
                      //   ),
                      // );
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
                      setState(() {
                        initialIndex = 1;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const DietInnerTab()),
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
                        Text("Weights",
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
    );
  }

  Widget leftRightheading(left, iconName, right, route) {
    return Container(
      padding: EdgeInsets.only(
        left: MySize.size16!,
        right: MySize.size16!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DDText(
            title: left,
            size: MySize.size15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
            },
            child: Row(
              children: [
                Icon(
                  iconName,
                  size: 18,
                  color: primaryColor,
                ),
                DDText(
                  title: right,
                  size: MySize.size15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headingView(title, bottomPadding) {
    return Container(
      padding: EdgeInsets.only(left: MySize.size16!, bottom: bottomPadding),
      child: Row(
        children: [
          DDText(
            title: title,
            size: MySize.size15,
          ),
        ],
      ),
    );
  }
}

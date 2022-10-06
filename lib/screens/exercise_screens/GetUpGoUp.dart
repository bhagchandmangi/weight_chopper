import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';

import 'package:weightchopper_flutter_project/screens/navigation_tabs/ExerciseSceen.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';

import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';

import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class GetUpGoUp extends StatefulWidget {
  const GetUpGoUp({Key? key}) : super(key: key);

  @override
  _GetUpGoUpState createState() => _GetUpGoUpState();
}

class _GetUpGoUpState extends State<GetUpGoUp> with TickerProviderStateMixin {
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
  //   _tabController.dispose();
  //   super.dispose();
  // }

  List<bool> days = [false, false, false, false, false, false, false];
  Color selectedBgColor = Colors.blue;
  Color selectedTextColor = Colors.white;
  Color unSelectedBgColor = Colors.grey[100]!;
  Color unSelectedTextColor = Colors.black;

  bool isFavourite = false;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    double margin = height * 0.02;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          notchMargin: MySize.size10!,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySize.size20!),
                  topRight: Radius.circular(MySize.size20!)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: MySize.size2!,
                  offset: const Offset(
                    0,
                    0,
                  ), // Shadow position
                ),
              ],
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MaterialButton(
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // currentScreen = DashboardScreen();
                          // _selectedIndex = 0;
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MySize.size4!, left: MySize.size6),
                      child: Image.asset(
                        "assets/icons/home.png",
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // _selectedIndex = 1;
                          // currentScreen = DiaryView();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size4!),
                      child: Image.asset(
                        "assets/icons/diaryy.png",
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    hoverColor: Colors.transparent,
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // _selectedIndex = 2;
                          // currentScreen = LiveTrackingView();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size4!),
                      child: Image.asset(
                        "assets/icons/watch.png",
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // currentScreen = FavouriteTabInnerPage();
                          // _selectedIndex = 3;
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size4!),
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(MySize.size8),
                  child: Container(
                    width: MySize.size44,
                    height: MySize.size44,
                    decoration: BoxDecoration(
                      color: const Color(0xff4885ED),
                      border: Border.all(
                        color: const Color(0xff4885ED),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(MySize.size30!),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print("add pressed");
                        setState(
                          () {
                            // _selectedIndex = 4;
                          },
                        );
                      },
                      icon: const Icon(
                        MdiIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
                  height: height * 0.25,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/bannar.png',
                        fit: BoxFit.cover,
                        height: height * 0.3,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Get Up Go Up",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.fromLTRB(margin, margin, 0, 0),
                child: const Text(
                  "Days",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              daysRowLatest(margin, height),
              const SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.fromLTRB(margin, 10, margin, margin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Set 1",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "2 Reps",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(margin, 0, margin, margin),
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ExerciseScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0, 0, margin, 0),
                                    height: height * 0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/images/1.png',
                                            ))),
                                  ),
                                ),
                                SizedBox(
                                    height: height * 0.12,
                                    width: MediaQuery.of(context).size.width -
                                        (MediaQuery.of(context).size.width *
                                            0.31),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Walk",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[700],
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const Text(
                                              "10 minutes",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const Icon(
                                              Icons.play_arrow,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "200 kcal",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isFavourite =
                                                          !isFavourite;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: isFavourite == true
                                                        ? Colors.red
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isAdded = !isAdded;
                                                    });
                                                  },
                                                  child: Icon(
                                                    isAdded == true
                                                        ? MdiIcons.minus
                                                        : MdiIcons.plus,
                                                    color: Colors.blue,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.3,
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
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
        right: height * 0.026,
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
}

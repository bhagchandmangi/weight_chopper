import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/Controller/MeditationListData.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';

class MeditationViewMind extends StatefulWidget {
  const MeditationViewMind({Key? key}) : super(key: key);

  @override
  _MeditationViewMindState createState() => _MeditationViewMindState();
}

class _MeditationViewMindState extends State<MeditationViewMind>
    with TickerProviderStateMixin {
  List<bool> days = [false, false, false, false, false, false, false];
  Color selectedBgColor = Colors.blue;
  Color selectedTextColor = Colors.white;
  Color unSelectedBgColor = Colors.grey[100]!;
  Color unSelectedTextColor = Colors.black;

  TabController? _tabController;

  bool isFavourite = false;
  bool isAdded = false;

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
    _tabController!.animateTo(3);
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    double margin = height * 0.02;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
        appBar: customAppBar(
          context,
          tabBar: TabBar(
            onTap: (index) {
              setState(() {
                _tabController!.index = 3;
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
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                        child: Image.asset(
                          'assets/images/meditation_banner.png',
                          fit: BoxFit.cover,
                          height: height * 0.3,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Meditation",
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
                      "Morning",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      "8:30",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(margin, 0, margin, margin),
                child: ListView.builder(
                  itemCount: meditationListdata.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0, 0, margin, 0),
                                    height: height * 0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          meditationListdata[index]["image"],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.12,
                                  width: MediaQuery.of(context).size.width -
                                      (MediaQuery.of(context).size.width * 0.3),
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
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: MySize.size6),
                                            child: Text(
                                              meditationListdata[index]
                                                  ["title"],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[700],
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: MySize.size6),
                                            child: DDText(
                                              title: meditationListdata[index]
                                                  ["subtitle"],
                                              size: 12,
                                              color: Colors.grey,
                                              weight: FontWeight.w300,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.play_arrow,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    meditationListdata[index]
                                                            ["heartselected"] =
                                                        !meditationListdata[
                                                                index]
                                                            ["heartselected"];

                                                    // isFavourite = !isFavourite;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: meditationListdata[
                                                                  index][
                                                              "heartselected"] ==
                                                          true
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
                                                    meditationListdata[index][
                                                            "foodAddselected"] =
                                                        !meditationListdata[
                                                                index]
                                                            ["foodAddselected"];
                                                  });
                                                },
                                                child: Icon(
                                                  meditationListdata[index][
                                                              "foodAddselected"] ==
                                                          true
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.3,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MySize.size20!, bottom: MySize.size30!),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, margin, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DDText(
                              title: "Noon",
                              size: 15,
                              color: Colors.black,
                            ),
                            Container(
                              // padding: EdgeInsets.only(right: MySize.size10),
                              child: DDText(
                                title: "12:30",
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MySize.size10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         ExerciseScreen(),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, margin, 0),
                              height: height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/meditation_3.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: height * 0.12,
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width * 0.3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Breathing Exercise",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const Text(
                                      "3-5 min",
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isFavourite = !isFavourite;
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
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.3,
                      ),
                    ]),
              ),
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
}

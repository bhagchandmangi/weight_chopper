import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';

import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietInnerTab.dart';

import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/SearchDietFood.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';

import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class AddDietCustomPlan extends StatefulWidget {
  const AddDietCustomPlan({Key? key}) : super(key: key);

  @override
  _AddDietCustomPlanState createState() => _AddDietCustomPlanState();
}

class _AddDietCustomPlanState extends State<AddDietCustomPlan>
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
// Commint for Testing Git Respositry
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController!.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int initialIndex;

    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double margin = height * 0.02;

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
                _tabController!.index = 1;
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
                      'assets/images/Diet.png',
                      fit: BoxFit.cover,
                      height: height * 0.3,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              Flushbar(
                                title: "Message",
                                message: "Edit Icon Pressed",
                                duration: const Duration(seconds: 1),
                              ).show(context);
                            },
                            child: const Icon(
                              FontAwesomeIcons.edit,
                              size: 14,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: MySize.size300,
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // counterStyle: TextStyle(color: Colors.red),
                            hintText: "Name",

                            hintStyle: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size30,
              ),
              headingView("Select Days", MySize.size0),
              daysRowLatest(margin, height),
              SizedBox(
                height: MySize.size20,
              ),
              leftRightheading("Morning", "Select Time"),
              SizedBox(height: MySize.size10!),
              gridSectionforAddFood("assets/images/oats.png", "Russian Salad",
                  "250 grams", "200"),
              const Divider(),
              leftRightheading("Lunch", "Select Time"),
              SizedBox(height: MySize.size10!),
              gridSectionforAddFood(null, null, null, null),
              const Divider(),
              leftRightheading("Dinner", "Select Time"),
              SizedBox(height: MySize.size10!),
              gridSectionforAddFood(null, null, null, null),
              SizedBox(height: MySize.size10!)
            ],
          ),
        ),
      ),
    );
  }

  Container gridSectionforAddFood(imageUrl, title, weight, calories) {
    return Container(
      padding: EdgeInsets.only(
        left: MySize.size16!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchDietFood()));
            },
            child: Row(
              children: [
                imageUrl == null
                    ? Image.asset("assets/images/food_add.png")
                    : Image.asset(imageUrl),
                Container(
                  padding: EdgeInsets.only(left: MySize.size16!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title == null
                          ? DDText(title: "")
                          : DDText(
                              title: title,
                              size: MySize.size15,
                              weight: FontWeight.w300),
                      weight == null
                          ? DDText(title: "")
                          : DDText(
                              title: weight,
                              size: MySize.size11,
                              color: Colors.grey,
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: MySize.size24!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                calories == null ? DDText(title: "") : DDText(title: "200 cal"),
                calories == null
                    ? const Text("")
                    : GestureDetector(
                        onTap: () {
                          Flushbar(
                            backgroundColor: Colors.red,
                            title: "Message",
                            message: "Tapped on delete Icon",
                            duration: const Duration(seconds: 3),
                          ).show(context);
                        },
                        child: Image.asset("assets/icons/delete_food.png")),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget headingView(title, bottomPadding) {
    return Container(
      padding: EdgeInsets.only(left: MySize.size16!, bottom: bottomPadding),
      child: Container(
        // margin: const EdgeInsets.only(right: 100, left: 10),
        child: TextField(
          style: GoogleFonts.openSans(
              fontSize: MySize.size15, color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Select Days',
            hintStyle: GoogleFonts.openSans(
                fontSize: MySize.size15, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget leftRightheading(left, right) {
    return Container(
      padding: EdgeInsets.only(
        left: MySize.size16!,
        right: MySize.size16!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
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
}

import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/CustomSwitch.dart';

import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({Key? key}) : super(key: key);

  @override
  _FollowUpScreenState createState() => _FollowUpScreenState();
}

bool _enabled = true;

class _FollowUpScreenState extends State<FollowUpScreen>
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
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const CustomDrawer(),
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
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
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              // ############################# FIRST #####################
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16!,
                    top: MySize.size40!,
                    bottom: MySize.size16!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: MySize.size15!),
                          child: Image.asset("assets/icons/call.png"),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: MySize.size16!,
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: MySize.size30!),
                            child: DDText(
                              title: "Follow Up Calls",
                              size: MySize.size15!,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ]),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: MySize.size8),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: MySize.size20!),
                            child: CustomSwitch(
                              value: _enabled,
                              onChanged: (bool val) {
                                setState(() {
                                  _enabled = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: const Divider(
                  color: Color(0xffF8F8FA),
                  thickness: 5,
                ),
              ),

              // #################### SECOND ##################
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16!,
                    top: MySize.size16!,
                    bottom: MySize.size16!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: MySize.size15!),
                            child: Image.asset("assets/icons/clock.png")),
                      ],
                    ),
                    // SizedBox(
                    //   width: MySize.size16!,
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: MySize.size30!),
                            child: DDText(
                              title: "Routine",
                              size: MySize.size15!,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ]),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: MySize.size8),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: MySize.size20!),
                            child: Row(
                              children: [
                                DDText(
                                  title: "Weekly",
                                  size: MySize.size11,
                                ),
                                Icon(
                                  Icons.expand_more,
                                  size: MySize.size20!,
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
              // ############################ THIRD ########################
              Container(
                child: const Divider(
                  color: Color(0xffF8F8FA),
                  thickness: 5,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16!,
                    top: MySize.size16!,
                    bottom: MySize.size16!),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: MySize.size18!),
                            child: Image.asset("assets/icons/mobile_blue.png")),
                      ],
                    ),
                    // SizedBox(
                    //   width: MySize.size16!,
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: MySize.size30!),
                            child: DDText(
                              title: "+123-456-789",
                              size: MySize.size15!,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ]),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: MySize.size8),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: MySize.size20!),
                            child: Image.asset("assets/icons/edit_blue.png"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: const Divider(
                  color: Color(0xffF8F8FA),
                  thickness: 5,
                ),
              ),
              //  ##################################### FOURTH ###################################
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16!,
                    top: MySize.size16!,
                    bottom: MySize.size16!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: MySize.size15!),
                          child: Image.asset("assets/icons/zip-code.png"),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: MySize.size16!,
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: MySize.size30!),
                            child: DDText(
                              title: "63100",
                              size: MySize.size15!,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ]),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: MySize.size8),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: MySize.size20!),
                            child: Image.asset("assets/icons/edit_blue.png"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: const Divider(
                  color: Color(0xffF8F8FA),
                  thickness: 5,
                ),
              ),

              // ################################ FIFTH ##################################
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16!,
                    top: MySize.size16!,
                    bottom: MySize.size16!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MySize.size50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: MySize.size15!),
                          child: Image.asset("assets/icons/check_blue.png"),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: MySize.size16!,
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: MySize.size30!),
                            child: DDText(
                              title: "Response Last Week",
                              size: MySize.size15!,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ]),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: MySize.size8),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: MySize.size20!),
                              child: const Text(""))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MySize.size42!, right: MySize.size42!),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dayName(day: "Mon", icon: "assets/icons/check_green.png"),
                    const SizedBox(width: 10),
                    dayName(day: "Tue", icon: "assets/icons/check_green.png"),
                    const SizedBox(width: 10),
                    dayName(day: "Wed", icon: "assets/icons/check_green.png"),
                    const SizedBox(width: 10),
                    dayName(day: "Thu", icon: "assets/icons/check_green.png"),
                    const SizedBox(width: 10),
                    dayName(day: "Fri", icon: "assets/icons/check_green.png"),
                    const SizedBox(width: 10),
                    dayName(day: "Sat", icon: "assets/icons/close_circle.png"),
                    const SizedBox(width: 10),
                    dayName(day: "Sun", icon: "assets/icons/close_circle.png"),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget dayName({day, icon}) {
    return Expanded(
      flex: 1,
      child: Container(
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(
            color: const Color(0xffDFDFDF),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        // padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            const SizedBox(height: 4),
            Text(day),
            Image.asset(icon),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

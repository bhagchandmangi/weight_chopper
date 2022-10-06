import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/chat/DetailChatScreen.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/RunningTab.dart';

import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietTabView.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MindTabView.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class CoachesList extends StatefulWidget {
  const CoachesList({Key? key}) : super(key: key);

  @override
  _CoachesListState createState() => _CoachesListState();
}

int _indexOfTab = 0;
TabController? _tabController;

class _CoachesListState extends State<CoachesList> {
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
            controller: _tabController,
            onTap: (index) {
              setState(() {
                _indexOfTab = index;
              });
            },
            labelPadding: EdgeInsets.only(left: MySize.size4!),
            indicatorColor: _indexOfTab == 0
                ? Colors.transparent
                : _indexOfTab == 1
                    ? Colors.blue
                    : Colors.blue,
            labelColor:
                _indexOfTab == 0 ? Colors.black : const Color(0xff4885ED),
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
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            child: Column(
                              children: [
                                // SizedBox(
                                //   height: MySize.size26,
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MySize.size20!,
                                      top: MySize.size30!),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DDText(
                                            title: "24/7",
                                            color: const Color(0xff4885ED),
                                            weight: FontWeight.w300,
                                          ),
                                          DDText(
                                            title: "How can we help?",
                                            color: const Color(0xff4885ED),
                                            weight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size26,
                                ),
                                Container(
                                  child: const Divider(
                                    color: Color(0xffF8F8FA),
                                    thickness: 5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const DetailChatScreen(
                                        title: "Diet Coach",
                                      );
                                    }));
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(MySize.size20!),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MySize.size14!),
                                              child: Image.asset(
                                                  "assets/icons/diet_coach.png"),
                                            ),
                                            DDText(title: "Diet Coach"),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            size: MySize.size14!,
                                            color: const Color(0xffafafaf)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Divider(
                                    color: Color(0xffF8F8FA),
                                    thickness: 5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const DetailChatScreen(
                                        title: "Exercise Coach",
                                      );
                                    }));
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(MySize.size20!),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MySize.size14!),
                                              child: Image.asset(
                                                  "assets/icons/exercise_coach.png"),
                                            ),
                                            DDText(title: "Exercise Coach"),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            size: MySize.size14!,
                                            color: const Color(0xffafafaf)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Divider(
                                    color: Color(0xffF8F8FA),
                                    thickness: 5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const DetailChatScreen(
                                        title: "Therapy Coach",
                                      );
                                    }));
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(MySize.size20!),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MySize.size14!),
                                              child: Image.asset(
                                                  "assets/icons/therapy_coach.png"),
                                            ),
                                            DDText(title: "Therapy Coach"),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            size: MySize.size14!,
                                            color: const Color(0xffafafaf)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Divider(
                                    color: Color(0xffF8F8FA),
                                    thickness: 5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Flushbar(
                                      title: "Message",
                                      message: "Tapped on FAQ's",
                                      duration: const Duration(seconds: 3),
                                    ).show(context);
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(MySize.size20!),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MySize.size14!),
                                              child: Image.asset(
                                                  "assets/icons/faqs.png"),
                                            ),
                                            DDText(title: "FAQs"),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            size: MySize.size14!,
                                            color: const Color(0xffafafaf)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Divider(
                                    color: Color(0xffF8F8FA),
                                    thickness: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
}

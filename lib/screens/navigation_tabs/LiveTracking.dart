import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';

import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietTabView.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/RunningTab.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MindTabView.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class LiveTrackingView extends StatefulWidget {
  const LiveTrackingView({Key? key}) : super(key: key);

  @override
  _LiveTrackingViewState createState() => _LiveTrackingViewState();
}

class _LiveTrackingViewState extends State<LiveTrackingView> {
  var workList = ["Today", "Week", "Month"];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(MySize.size56),
        //   child: CustomAppBar(),
        // ),
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

        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(MySize.size56),
        //   child: AppBar(
        //     elevation: 0.5,
        //     backgroundColor: Colors.white,
        //     bottom: TabBar(
        //       labelPadding: EdgeInsets.only(left: MySize.size4!),
        //       indicatorColor: Color(0xff4885ED),
        //       labelColor: Color(0xff4885ED),
        //       indicatorSize: TabBarIndicatorSize.label,
        //       unselectedLabelColor: Colors.black87,
        //       // labelStyle: TextStyle(
        //       //   fontSize: MySize.size10!,
        //       //   color: Colors.black54,
        //       //   fontFamily: "Open Sans",
        //       //   fontWeight: FontWeight.w400,
        //       // ),
        //       tabs: [
        //         Tab(
        //           text: 'Today',
        //         ),
        //         Tab(text: 'Diet'),
        //         Tab(text: 'Exercise'),
        //         Tab(text: 'Mind'),
        //       ],
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: TabBarView(children: [
                liveTrackingBody(),
                const DietTabView(),
                const RunningTabView(),
                const MindTabView(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

// ############################ BODY #################################

  Widget liveTrackingBody() {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Card(
        elevation: 0.8,
        margin: EdgeInsets.only(
            left: MySize.size10!, right: MySize.size10!, top: MySize.size32),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // SizedBox(height: 10),
            // ##############################  TODAY SECTION ################################################################
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: MySize.size14,
                  ),
                  onPressed: () {
                    setState(() {
                      counter++;
                      if (counter > 2) {
                        counter = 0;
                      }
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(MySize.size4!),
                  child: DDText(
                    title: workList[counter],
                    size: MySize.size15,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: MySize.size14,
                  ),
                  onPressed: () {
                    setState(() {
                      counter++;
                      if (counter > 2) {
                        counter = 0;
                      }
                    });
                  },
                ),
              ],
            ),
            // SizedBox(height: 40),
            // ############################## STEPS PROGRESS  ################################################################

            progressIndicatorView(),
            SizedBox(
              height: MySize.size20!,
            ),
            // ############################## FLOOR, MILES, CALS, MINS VIEW ################################################################

            floorMilesCalculationView(),
            const Divider(
              thickness: 1.5,
            ),

            Container(
              padding:
                  EdgeInsets.only(bottom: MySize.size20!, top: MySize.size24!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: MySize.size40!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.only(right: MySize.size10!),
                                    child: Icon(MdiIcons.heart,
                                        color: Colors.red,
                                        size: MySize.size16)),
                                DDText(
                                  title: "72",
                                  size: MySize.size20!,
                                  weight: FontWeight.w400,
                                ),
                                DDText(
                                  title: "bpm",
                                  size: MySize.size13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: MySize.size10!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DDText(
                                  title: "5bpm resting heart rate",
                                  size: MySize.size11,
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
            ),
            const Divider(
              thickness: 1.5,
            ),

            Container(
              padding:
                  EdgeInsets.only(bottom: MySize.size20!, top: MySize.size24!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: MySize.size30!),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size10!,
                                      right: MySize.size10!),
                                  child: Icon(FontAwesomeIcons.solidMoon,
                                      size: MySize.size16,
                                      color: const Color(0xff8576F1)),
                                ),
                                DDText(
                                  title: "8",
                                  size: MySize.size20!,
                                  weight: FontWeight.w400,
                                ),
                                DDText(
                                  title: "hr",
                                  size: MySize.size13,
                                ),
                                DDText(
                                  title: "16 ",
                                  size: MySize.size20!,
                                  weight: FontWeight.w400,
                                ),
                                DDText(
                                  title: "mins",
                                  size: MySize.size13,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(right: MySize.size10!),
                                  child: DDText(
                                      title: "7hr 23min deep sleep",
                                      size: MySize.size11),
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
            ),

            const Divider(thickness: 1.5),
            Container(
              padding:
                  EdgeInsets.only(bottom: MySize.size26!, top: MySize.size24!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: MySize.size40!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.only(right: MySize.size10!),
                                    child: Icon(FontAwesomeIcons.fire,
                                        color: Colors.amber,
                                        size: MySize.size16)),
                                DDText(
                                    title: "5,644 ",
                                    size: MySize.size20!,
                                    weight: FontWeight.w400),
                                DDText(
                                  title: "cals",
                                  size: MySize.size13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: MySize.size20!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DDText(
                                    title: "233 calories left",
                                    size: MySize.size11),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// ############################ FLOOR, MILES, CALS, MINS #################################

  Row floorMilesCalculationView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(MySize.size8),
          child: Column(
            children: [
              Countup(
                begin: 0,
                end: 4,
                duration: const Duration(seconds: 1),
                separator: ',',
                style: GoogleFonts.openSans(
                    color: const Color(0xff4985ef),
                    fontSize: MySize.size15,
                    fontWeight: FontWeight.w400),
              ),
              DDText(
                  title: "Floors",
                  weight: FontWeight.w400,
                  size: MySize.size12),
            ],
          ),
        ),
        Column(
          children: [
            Countup(
              begin: 0,
              end: 2.10,
              duration: const Duration(seconds: 1),
              separator: ',',
              style: GoogleFonts.openSans(
                  color: const Color(0xff4985ef),
                  fontSize: MySize.size15,
                  fontWeight: FontWeight.w400),
            ),
            DDText(title: "Miles", weight: FontWeight.w400, size: MySize.size12)
          ],
        ),
        Column(
          children: [
            Countup(
              begin: 0,
              end: 1544,
              duration: const Duration(seconds: 1),
              separator: ',',
              style: GoogleFonts.openSans(
                  color: const Color(0xff4985ef),
                  fontSize: MySize.size15,
                  fontWeight: FontWeight.w400),
            ),
            DDText(title: "Cals", weight: FontWeight.w400, size: MySize.size12),
          ],
        ),
        Column(
          children: [
            Countup(
              begin: 0,
              end: 9,
              duration: const Duration(seconds: 1),
              separator: ',',
              style: GoogleFonts.openSans(
                  color: const Color(0xff4985ef),
                  fontSize: MySize.size15,
                  fontWeight: FontWeight.w400),
            ),
            DDText(title: "Mins", weight: FontWeight.w400, size: MySize.size12),
          ],
        ),
      ],
    );
  }

// ############################  CIRCULAR PROGRESS    ###############################

  Widget progressIndicatorView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          backgroundColor: const Color(0xffdedede),
          radius: MySize.size180!,
          lineWidth: MySize.size14!,
          animation: true,
          percent: 0.7,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Countup(
                begin: 0,
                end: 5600,
                duration: const Duration(seconds: 1),
                separator: ',',
                style: GoogleFonts.openSans(
                    fontSize: MySize.size26, fontWeight: FontWeight.w600),
              ),
              DDText(
                title: "Steps",
                size: MySize.size19,
              )
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: const Color(0xff4985ef),
        ),
      ],
    );
  }
}

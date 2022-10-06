import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/CoachesList.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/NutritionScreen.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/NutritionScreenView.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/SearchFood.dart';
import 'package:weightchopper_flutter_project/screens/navigation_tabs/DashBoardScreen.dart';

import 'package:weightchopper_flutter_project/screens/navigation_tabs/DiaryView.dart';

import 'package:weightchopper_flutter_project/screens/navigation_tabs/LiveTracking.dart';

import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

enum ThemeStyle {
  FloatingBar,
  Light,
}

class BottomBar extends StatefulWidget {
  final selectedIndex;
  const BottomBar({this.selectedIndex});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool _isShowDial = false;
  bool _isVisible = false;

  final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    const CoachesList(),
    const LiveTrackingView(),
    // DietTabs(),
    const NutritionScreen(),
    const DiaryView(),
  ];
  int _selectedIndex = 0;

  int? temp;
  var weightDropValue = "kg";
  var glassDropValue = "cup";

  final PageStorageBucket bucket = PageStorageBucket();

  Widget? currentScreen;
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.selectedIndex != null
          ? _selectedIndex = widget.selectedIndex
          : _selectedIndex = 0;
      currentScreen = _widgetOptions[_selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(),
      drawer: const CustomDrawer(),

      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(MySize.size56),
      //   child: CustomAppBar(),
      // ),
      body: PageStorage(
        bucket: bucket,
        child: Stack(
          children: [
            Container(child: currentScreen),
            Visibility(
              visible: _isVisible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isShowDial = false;
                    _isVisible = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationView(),
    );
  }

// ############################## DIALOG FOR FOOD IN FAB(Floating Action Button) ###########################

  dialogForFood() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchFood()));
                  },
                  child: Container(
                    // padding: EdgeInsets.only(top: 20),
                    height: MySize.size100!,
                    width: MySize.size100!,
                    margin: const EdgeInsets.only(bottom: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/breakfast.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          DDText(
                            title: "Breakfast",
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchFood()));
                  },
                  child: Container(
                    // padding: EdgeInsets.only(top: 20),
                    height: MySize.size100!,
                    width: MySize.size100!,
                    margin: const EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/lunch.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          DDText(
                            title: "Lunch",
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchFood()));
                  },
                  child: Container(
                    // padding: EdgeInsets.only(top: 20),
                    height: MySize.size100!,
                    width: MySize.size100!,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/dinner2.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          DDText(
                            title: "Dinner",
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchFood()));
                  },
                  child: Container(
                    // padding: EdgeInsets.only(top: 20),
                    height: MySize.size100!,
                    width: MySize.size100!,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/snack.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          DDText(
                            title: "Snacks",
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

// ############################## DIALOG FOR WEIGHT IN FAB(Floating Action Button) ###########################

  dialogForWeight() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(builder: (context, stateSet) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            // contentPadding: EdgeInsets.all(0),
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                // height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MySize.size20!,
                    ),
                    Image.asset("assets/icons/scale.png"),
                    SizedBox(
                      height: MySize.size20!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),

                          width: MySize.size80,
                          // height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(1),
                              hintText: "0",
                              hintStyle: GoogleFonts.openSans(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // padding: EdgeInsets.only(left: 20),
                          width: MySize.size50,
                          child: DropdownButton<String>(
                            iconSize: 0.0,
                            value: weightDropValue,
                            underline: const SizedBox(),
                            isExpanded: true,
                            items: <String>['kg', 'lbs'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text("$value(s)"),
                              );
                            }).toList(),
                            onChanged: (value) {
                              stateSet(() {
                                weightDropValue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MySize.size20!,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Text("Add"),
                    ),
                    SizedBox(
                      height: MySize.size10!,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

// ############################## DIALOG FOR WATER IN FAB(Floating Action Button) ###########################

  dialogForWater() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(builder: (context, stateSet) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            // contentPadding: EdgeInsets.all(0),
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                // height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MySize.size20!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/water_glass.png",
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: MySize.size20!,
                    // ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size84!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),

                            width: MySize.size60,
                            // height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(1),
                                hintText: "0",
                                hintStyle: GoogleFonts.openSans(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 8),
                            width: MySize.size100!,
                            child: DropdownButton<String>(
                              iconSize: 0.0,
                              value: glassDropValue,
                              underline: const SizedBox(),
                              isExpanded: true,
                              items: <String>['cup', 'mug'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: DDText(
                                    title: "$value(s)",
                                    size: 11,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                stateSet(() {
                                  glassDropValue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Flushbar(
                                title: "Success!",
                                message: "+1 CUP Added!",
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                              ).show(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff797A7A),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: DDText(
                                  title: "+1 CUP",
                                  size: 11,
                                  weight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Flushbar(
                                title: "Success!",
                                message: "+2 CUP Added!",
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                              ).show(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff797A7A),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: DDText(
                                  title: "+2 CUP",
                                  size: 11,
                                  weight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Flushbar(
                                title: "Success!",
                                message: "+3 CUP Added!",
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                              ).show(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff797A7A),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: DDText(
                                  title: "+3 CUP",
                                  size: 11,
                                  weight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: MySize.size20!,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Text("Add"),
                    ),
                    SizedBox(
                      height: MySize.size10!,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

// ############################ BOTTOM NAVIGATION VIEW #################################

  Widget _getFloatingActionButton() {
    return SpeedDialMenuButton(
      isEnableAnimation: true,

      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        _isShowDial = isShow;
      },
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          isExtended: true,
          heroTag: "floating_button_menu",
          backgroundColor: primaryColor,
          mini: false,
          autofocus: true,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          closeMenuChild: const Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: primaryColor),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(
          heroTag: "water",
          mini: true,
          onPressed: () {
            //if need to close menu after click

            setState(() {
              _isVisible = false;
              _isShowDial = false;
              print(_isVisible);
            });
            dialogForWater();
          },
          backgroundColor: Colors.white,
          child: const Tooltip(
            message: "Water",
            child: Icon(
              Icons.water,
              color: Colors.grey,
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: "exercise",
          mini: true,
          onPressed: () {
            //if need to toggle menu after click
            _isShowDial = !_isShowDial;
            setState(() {});
          },
          backgroundColor: Colors.white,
          child: const Tooltip(
            message: "Exercise",
            child: Icon(
              FontAwesomeIcons.running,
              color: Colors.grey,
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: "food",
          mini: true,
          onPressed: () {
            setState(() {
              _isVisible = false;
              _isShowDial = false;
              print(_isVisible);
            });
            dialogForFood();
          },
          backgroundColor: Colors.white,
          child: const Tooltip(
            message: "Food",
            child: Icon(
              Icons.food_bank,
              color: Colors.grey,
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: "weight",
          mini: true,
          onPressed: () {
            setState(() {
              _isVisible = false;
              _isShowDial = false;
            });

            dialogForWeight();
          },
          backgroundColor: Colors.white,
          child: const Tooltip(
            message: "Weight",
            child: Icon(
              Icons.monitor_weight,
              color: Colors.grey,
            ),
          ),
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }

  Widget bottomNavigationView() {
    // widget.checkIndex != null ? _selectedIndex = 4 : temp = 0;
    return BottomAppBar(
      color: _isVisible ? Colors.black.withOpacity(0.5) : Colors.transparent,
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
                      print(_selectedIndex);
                      currentScreen = DashboardScreen();
                      _selectedIndex = 0;
                    },
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MySize.size4!, left: MySize.size6),
                  child: Image.asset(
                    "assets/icons/home.png",
                    color: _selectedIndex == 0
                        ? const Color(0xff4885ED)
                        : Colors.grey[300],
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
                      print(_selectedIndex);

                      currentScreen = const CoachesList();
                      _selectedIndex = 1;
                      // print(_selectedIndex);
                    },
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MySize.size4!, left: MySize.size6),
                  child: Image.asset(
                    "assets/icons/bottombar_1.png",
                    color: _selectedIndex == 1
                        ? const Color(0xff4885ED)
                        : Colors.grey[300],
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
                      _selectedIndex = 2;
                      currentScreen = const LiveTrackingView();
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: MySize.size4!),
                  child: Image.asset(
                    "assets/icons/bottombar_2.png",
                    color: _selectedIndex == 2
                        ? const Color(0xff4885ED)
                        : Colors.grey[300],
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
                      _selectedIndex = 3;
                      currentScreen = Center(child: NutritionScreenView());
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: MySize.size4!),
                  child: Icon(
                    FontAwesomeIcons.chartBar,
                    color: _selectedIndex == 3
                        ? const Color(0xff4885ED)
                        : Colors.grey[300],
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
                      currentScreen = const DiaryView();
                      _selectedIndex = 4;
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: MySize.size4!),
                  child: Image.asset(
                    "assets/icons/bottombar_4.png",
                    color: _selectedIndex == 4
                        ? const Color(0xff4885ED)
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: MaterialButton(
            //     minWidth: MySize.size50,
            //     onPressed: () {
            //       setState(
            //         () {
            //           print("add button pressed");
            //           _selectedIndex = 4;
            //         },
            //       );
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.only(top: MySize.size4!),
            //       child: Icon(
            //         FontAwesomeIcons.plusCircle,
            //         size: 45,
            //         color: primaryColor,
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(MySize.size8),
            //   child: Container(
            //     width: MySize.size4!4,
            //     height: MySize.size80,
            //     // decoration: BoxDecoration(
            //     //   color: Color(0xff4885ED),
            //     //   border: Border.all(
            //     //     color: Color(0xff4885ED),
            //     //   ),
            //     //   borderRadius: BorderRadius.all(
            //     //     Radius.circular(MySize.size30),
            //     //   ),
            //     // ),
            //     child: IconButton(
            //       onPressed: () {
            //         print("add pressed");
            //         setState(
            //           () {
            //             _selectedIndex = 4;
            //           },
            //         );
            //       },
            //       icon: Align(
            //         alignment: Alignment.topLeft,
            //         child: Icon(
            //           FontAwesomeIcons.plusCircle,
            //           color: Colors.blue,
            //           size: 50,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

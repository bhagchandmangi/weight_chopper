import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/chat/DetailChatScreen.dart';
import 'package:weightchopper_flutter_project/screens/FollowUpScreen.dart';
import 'package:weightchopper_flutter_project/screens/GroceryList.dart';
import 'package:weightchopper_flutter_project/screens/UltimateSelfieView.dart';
import 'package:weightchopper_flutter_project/screens/auth/login_screen.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/FavouriteInnerTab.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/CustomPlans.dart';

import 'package:weightchopper_flutter_project/screens/profile/SettingsScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: MySize.size100!),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(MySize.size50!),
                    bottomRight: Radius.circular(MySize.size50!)),
                child: SizedBox(
                  width: MySize.size220,
                  height: 560,
                  child: Drawer(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: ListView(
                            // Important: Remove any padding from the ListView.
                            padding: EdgeInsets.zero,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey[300]!,
                                          width: 0.5)),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size4!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/heart_drawer.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Favourites'),
                                  onTap: () {
                                    //############ NAVIGATOR ##########
                                    var route = MaterialPageRoute(
                                        builder: (context) =>
                                            const FavouriteTabInnerPage());
                                    Navigator.push(context, route);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                          color: (Colors.grey[300])!,
                                          width: 0.5)),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size4!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/before-after.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Ultimate Selfie'),
                                  onTap: () {
                                    //############ NAVIGATOR ##########
                                    var route = MaterialPageRoute(
                                        builder: (context) =>
                                            UltimateSelfieView());
                                    Navigator.push(context, route);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                          color: (Colors.grey[300])!,
                                          width: 0.5)),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size4!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/grocery_list.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Grocery List'),
                                  onTap: () {
                                    //############ NAVIGATOR ##########
                                    var route = MaterialPageRoute(
                                        builder: (context) =>
                                            const GroceryList());
                                    Navigator.push(context, route);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                          color: (Colors.grey[300])!,
                                          width: 0.5)),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size4!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/custom_food.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Custom Plans'),
                                  onTap: () {
                                    var route = MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomPlans());
                                    Navigator.push(context, route);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                          color: (Colors.grey[300])!,
                                          width: 0.3)),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size2!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/phone.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Follow-up call'),
                                  onTap: () {
                                    // Update the state of the app
                                    // ...
                                    // Then close the drawer
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const FollowUpScreen();
                                    }));
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                    color: (Colors.grey[300])!,
                                    width: 0.5,
                                  )),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size4!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/male-telemarketer.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Technical Support'),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const DetailChatScreen(
                                        title: "Technical support",
                                      );
                                    }));
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                          color: (Colors.grey[300])!,
                                          width: 0.5)),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size4!,
                                        top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/invoice.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Billing'),
                                  onTap: () {
                                    //############ NAVIGATOR ##########
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //                    <-- BoxDecoration
                                  border: Border(
                                      bottom: BorderSide(
                                    color: (Colors.grey[300])!,
                                    width: 0.5,
                                  )),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 3,
                                  leading: Padding(
                                    padding:
                                        EdgeInsets.only(top: MySize.size4!),
                                    child: Image.asset(
                                      'assets/icons/settings.png',
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  title: DDText(title: 'Settings'),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const SettingsScreen();
                                    }));
                                  },
                                ),
                              ),
                              ListTile(
                                horizontalTitleGap: 3,
                                leading: Padding(
                                  padding: EdgeInsets.only(
                                      top: MySize.size4!, left: MySize.size2!),
                                  child: Image.asset("assets/icons/logout.png"),
                                ),
                                title: DDText(title: 'Logout'),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

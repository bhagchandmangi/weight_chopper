import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/screens/NotificationScreen.dart';

AppBar customAppBar(BuildContext context,
    {tabBar, elevation, bellColor, bgColor}) {
  return AppBar(
    bottom: tabBar,
    leading: Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
            print("tapped");
          },
          child: Container(
            child: Image.asset(
              "assets/icons/menuu.png",
              color: Color(0xff797A7A),
            ),
          ),
        );
      },
    ),
    iconTheme: IconThemeData(color: Colors.grey),
    elevation: elevation == null ? 0 : elevation,
    backgroundColor: bgColor == null ? Colors.white : bgColor,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Image.asset(
            "assets/icons/bell2.png",
            color: bellColor == null ? Color(0xff797A7A) : bellColor,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NotificationScreen();
            }));
          },
        ),
      ),
    ],
  );
}

AppBar customAppBaronlyTab(BuildContext context,
    {tabBar, elevation, bellColor}) {
  return AppBar(
    bottom: tabBar,
    iconTheme: IconThemeData(color: Colors.grey),
    elevation: elevation == null ? 0 : elevation,
    backgroundColor: Colors.white,
  );
}

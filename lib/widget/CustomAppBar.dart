import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/screens/NotificationScreen.dart';

class CustomAppBar extends StatefulWidget {
  final tabBar;
  final elevation;
  final bellColor;
  const CustomAppBar({Key? key, this.tabBar, this.elevation, this.bellColor})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  // TabBar _tabBar;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: widget.tabBar,
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              child: Image.asset(
                "assets/icons/menuu.png",
                color: const Color(0xff797A7A),
              ),
            ),
          );
        },
      ),
      iconTheme: const IconThemeData(color: Colors.grey),
      elevation: widget.elevation ?? 0,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Image.asset(
              "assets/icons/bell2.png",
              color: widget.bellColor ?? Color(0xff797A7A),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NotificationScreen();
              }));
            },
          ),
        ),
      ],
    );
  }
}

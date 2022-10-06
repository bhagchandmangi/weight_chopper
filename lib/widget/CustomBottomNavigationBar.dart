import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';

class CustomStaticBottomNavigationBar extends StatefulWidget {
  final homeColor, diaryColor, liveTrackingColor, heartColor;
  const CustomStaticBottomNavigationBar(
      {Key? key,
      this.homeColor,
      this.diaryColor,
      this.heartColor,
      this.liveTrackingColor})
      : super(key: key);

  @override
  _CustomStaticBottomNavigationBarState createState() =>
      _CustomStaticBottomNavigationBarState();
}

class _CustomStaticBottomNavigationBarState
    extends State<CustomStaticBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                  padding:
                      EdgeInsets.only(top: MySize.size4!, left: MySize.size6),
                  child: Image.asset(
                    "assets/icons/home.png",
                    color: widget.homeColor == true
                        ? primaryColor
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
                      // currentScreen = DashboardScreen();
                      // _selectedIndex = 0;
                    },
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MySize.size4!, left: MySize.size6),
                  child: Image.asset(
                    "assets/icons/bottombar_1.png",
                    color: widget.homeColor == true
                        ? primaryColor
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
                      // _selectedIndex = 1;
                      // currentScreen = DiaryView();
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: MySize.size4!),
                  child: Image.asset(
                    "assets/icons/bottombar_2.png",
                    color: widget.diaryColor == true
                        ? primaryColor
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
                      // _selectedIndex = 2;
                      // currentScreen = LiveTrackingView();
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: MySize.size4!),
                  child: Icon(
                    FontAwesomeIcons.chartBar,
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
                  child: Image.asset(
                    "assets/icons/bottombar_4.png",
                    color: widget.heartColor == true
                        ? primaryColor
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

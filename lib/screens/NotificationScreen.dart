import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';

import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    List notificationData = [
      {
        "title": "Meal reminder (Lunch)",
        "details": "Your lunch time is about to start at 12:30",
        "icon": Icons.dinner_dining,
        "image": "assets/icons/dinner.png",
        "color": const Color(0xffD1DFF8)
      },
      {
        "title": "Catalog reminder (Lunch)",
        "details": "You forgot to log Your morning meal",
        "icon": Icons.list_alt,
        "image": "assets/icons/diary.png",
        "color": Colors.red
      },
      {
        "title": "Workout reminder (Lunch)",
        "details": "Your workout (Get Up Get Go) will start in 30 min",
        "icon": Icons.calculate,
        "image": "assets/icons/running-person.png",
        "color": Colors.yellow
      },
      {
        "title": "Meal reminder (Lunch)",
        "details": "Your lunch time is about to start at 12:30",
        "icon": Icons.dinner_dining,
        "image": "assets/icons/dinner.png",
        "color": const Color(0xffD1DFF8)
      },
      {
        "title": "Catalog reminder (Lunch)",
        "details": "You forgot to log Your morning meal",
        "icon": Icons.list_alt,
        "image": "assets/icons/diary.png",
        "color": Colors.red
      },
      {
        "title": "Workout reminder (Lunch)",
        "details": "Your workout (Get Up Get Go) will start in 30 min",
        "icon": Icons.calculate,
        "image": "assets/icons/running-person.png",
        "color": Colors.yellow
      },
      {
        "title": "Meal reminder (Lunch)",
        "details": "Your lunch time is about to start at 12:30",
        "icon": Icons.dinner_dining,
        "image": "assets/icons/dinner.png",
        "color": const Color(0xffD1DFF8)
      },
      {
        "title": "Catalog reminder (Lunch)",
        "details": "You forgot to log Your morning meal",
        "icon": Icons.list_alt,
        "image": "assets/icons/diary.png",
        "color": Colors.red
      },
      {
        "title": "Workout reminder (Lunch)",
        "details": "Your workout (Get Up Get Go) will start in 30 min",
        "icon": Icons.calculate,
        "image": "assets/icons/running-person.png",
        "color": Colors.yellow
      },
    ];
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customAppBar(
        context,
        bellColor: primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(MySize.size20!),
              child: Row(
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: MySize.size14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 14,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: notificationData.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
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
                                  CircleAvatar(
                                    radius: MySize.size26,
                                    backgroundColor: notificationData[i]
                                        ["color"],
                                    child: Image.asset(
                                        notificationData[i]["image"]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MySize.size16!,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DDText(
                                      title: notificationData[i]["title"],
                                      size: MySize.size14,
                                      weight: FontWeight.w600,
                                    ),
                                    DDText(
                                      title: notificationData[i]["details"],
                                      size: MySize.size12,
                                    )
                                  ]),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MySize.size20!,
                            right: MySize.size20!,
                          ),
                          child: const Divider(
                            // color: Colors.grey,
                            thickness: 0.5,
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print("click");
                  Flushbar(
                    backgroundColor: Colors.green,
                    title: "Success",
                    message: "Notification Deleted!!",
                    duration: const Duration(seconds: 1),
                  ).show(context);
                },
                child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: const Color(0xffdfdfdf),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      FontAwesomeIcons.solidTrashAlt,
                      size: 20,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

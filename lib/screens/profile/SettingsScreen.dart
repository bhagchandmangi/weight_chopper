import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';

import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/CoachesList.dart';
import 'package:weightchopper_flutter_project/screens/profile/EditProfile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    bool isSwitched = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: DDText(
          title: "Settings",
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size10!),
                        child: Row(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size100!)),
                              child: Container(
                                child: SizedBox(
                                  height: MySize.size80,
                                  width: MySize.size80,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(MySize.size6),
                                        child: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/profile3.jpg"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(title: "Don Watson"),
                                DDText(
                                  title: "donwatson@gmail.com",
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: EdgeInsets.only(right: MySize.size16!),
                        child: Container(
                          child: IconButton(
                            icon: const ImageIcon(
                              AssetImage(
                                "assets/icons/edit.png",
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const EditProfile();
                              }));
                            },
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MySize.size20!,
                  ),
                  const Divider(
                    thickness: 1,
                    // color: Colors.grey,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          "assets/icons/settings_goal.png",
                        ),
                        title: const Text("Goals"),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                      SizedBox(
                        height: MySize.size16,
                      ),
                      ListTile(
                        leading: const ImageIcon(
                          AssetImage(
                            "assets/icons/pushnotification.png",
                          ),
                        ),
                        title: const Text("Push Notifications"),
                        trailing: Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.blue[100],
                            activeColor: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MySize.size16,
                      ),
                      ListTile(
                        onTap: () {
                          var route = MaterialPageRoute(
                              builder: (context) => const CoachesList());
                          Navigator.push(context, route);
                        },
                        leading: Icon(
                          Icons.phone,
                          color: Colors.grey[400],
                        ),
                        title: const Text(
                          "Coach",
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                      ),
                      SizedBox(
                        height: MySize.size16,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.payment,
                          color: Colors.grey[400],
                        ),
                        title: const Text("Payment"),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(MySize.size20!),
                    margin: EdgeInsets.only(
                        left: MySize.size20!,
                        right: MySize.size20!,
                        bottom: MySize.size4!),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DDText(
                                  title: "Version",
                                  size: MySize.size14,
                                  weight: FontWeight.w300,
                                ),
                                DDText(
                                  title: "2.0.12",
                                  size: MySize.size12,
                                  weight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MySize.size8,
                        ),
                        Row(
                          children: [
                            DDText(
                              title: "Terms & Conditions",
                              weight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MySize.size14!),
                    margin: EdgeInsets.only(
                        left: MySize.size20!,
                        right: MySize.size20!,
                        bottom: MySize.size20!),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            DDText(
                              title: "About Us",
                              weight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

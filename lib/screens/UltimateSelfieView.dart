import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timelines/timelines.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/SearchFood.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class UltimateSelfieView extends StatefulWidget {
  const UltimateSelfieView({
    Key? key,
  }) : super(key: key);

  // final String title;

  @override
  _UltimateSelfieViewState createState() => _UltimateSelfieViewState();
}

class _UltimateSelfieViewState extends State<UltimateSelfieView>
    with TickerProviderStateMixin {
  // ignore: unused_field
  TabController? _tabController;
  bool _isShowDial = false;
  bool _isVisible = false;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Today',
    ),
    const Tab(text: 'Diet'),
    const Tab(text: 'Exercise'),
    const Tab(text: 'Mind'),
  ];
  bool swapImage = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  // ignore: unused_field
  List<XFile>? _imageFileList;

  set _imageFile(XFile value) {
    _imageFileList = value == null ? null : [value];
  }

  // ignore: unused_field
  dynamic _pickImageError;

// ########################## FUNCTION TO GET IMAGES FROM GALLERY #####################

  Future getImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = pickedFile!;
      });
      return _imageFileList;
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

// ########################## FUNCTION TO GET IMAGES FROM CAMERA #####################

  Future getImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      setState(() {
        _imageFile = pickedFile!;
      });
      return _imageFileList;
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

// ################### IMAGES USED TO SHOW ######################

  List imagesData = [
    {"image": "assets/images/image11.png"},
    {"image": "assets/images/image2.png"},
    {"image": "assets/images/image3.png"},
    {"image": "assets/images/image4.png"},
  ];

// ############################## DIALOG FOR GALLERY AND CAMERA OPTION ###########################

  dialogForCamera() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: MySize.size240,
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SizedBox.expand(
                child: Column(
              children: [
                SizedBox(
                  height: MySize.size20!,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DDText(
                      title: "Choose an Action",
                      size: MySize.size16,
                      weight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: MySize.size10,
                ),
                Divider(
                  color: primaryColor,
                  thickness: 2,
                ),
                Container(
                  child: Row(
                    children: [
                      TextButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(20)
                              // primary: Colors.transparent,

                              ),
                          icon: Icon(FontAwesomeIcons.images),
                          onPressed: () async {
                            getImageFromGallery().then((value) {
                              Navigator.pop(context);
                              showAlert(context, value);
                            });
                          },
                          label: DDText(
                            title: "Choose From Gallery",
                          )),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    TextButton.icon(
                        style:
                            ElevatedButton.styleFrom(padding: EdgeInsets.all(20)
                                // primary: Colors.transparent,

                                ),
                        icon: Icon(FontAwesomeIcons.camera),
                        onPressed: () async {
                          getImageFromCamera().then((image) {
                            // print(image[0]);
                            Navigator.pop(context);
                            showAlert(context, image);
                          });
                        },
                        label: DDText(
                          title: "Capture From Camera",
                        )),
                  ],
                ),

                // Divider(),
              ],
            )),
          ),
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

// ############################## DIALOG FOR IMAGE ###########################

  showAlert(BuildContext context, value) {
    print(value);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: AlertDialog(
                  contentPadding: const EdgeInsets.all(0),
                  actions: <Widget>[
                    Column(
                      children: [
                        value == null
                            ? const CircularProgressIndicator()
                            : Image.file(
                                File(value[0].path),
                              ),
                        SizedBox(
                          height: MySize.size20!,
                        ),
                      ],
                    ),
                    Column(children: [
                      Row(
                        children: [
                          Text("Add Weight: ",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(
                              width: MySize.size40,
                              // height: 40,
                              child: TextField(
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    hintText: "88",
                                    hintStyle: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(
                            width: MySize.size50,
                            child: DropdownButton<String>(
                              iconSize: 0.0,
                              value: weightDropValue,
                              underline: const SizedBox(),
                              isExpanded: true,
                              items: <String>['kg', 'lbs'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size20!,
                      ),
                      Row(
                        children: [
                          Text("Add Waist: ",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: MySize.size40,

                                    // height: 40,
                                    child: TextField(
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          hintText: "88",
                                          hintStyle: GoogleFonts.openSans(
                                              fontWeight: FontWeight.bold)),
                                    )),
                                SizedBox(
                                  width: MySize.size50,
                                  child: DropdownButton<String>(
                                    iconSize: 0.0,
                                    value: waitDropDownValue,
                                    underline: const SizedBox(),
                                    isExpanded: true,
                                    items: <String>['in', 'cm']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size20!,
                      ),
                      Row(
                        children: [
                          Text("Date: ",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                              )),
                          Text("31/05/2021",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size40,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("Discard",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xffE55864))),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff4885ED)),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// ############################## COMPARE IMAGES DIALOG ###########################

  showAlert2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: AlertDialog(
              // contentPadding: EdgeInsets.all(0),
              insetPadding:
                  EdgeInsets.only(bottom: MySize.size2!, top: MySize.size2!),
              clipBehavior: Clip.antiAlias,
              // contentPadding: EdgeInsets.fromLTRB(50, 50, 50, 50),
              actions: <Widget>[
                Container(
                  // padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              // padding: EdgeInsets.only(right: 2),
                              height: MediaQuery.of(context).size.height / 1.4,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.asset(
                                "assets/images/before2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 2, right: 0),
                              height: MediaQuery.of(context).size.height / 1.4,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                "assets/images/after2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Weight: ",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text("111",
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.bold)),
                                          const Text("kg"),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Waist: ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text("62",
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.bold)),
                                      const Text("in")
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Date: ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text("31/05/2021",
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w300)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: const SizedBox(
                                    height: 70.0,
                                    child: SolidLineConnector(
                                      color: Color(0xffdfdfdf),
                                    ),
                                  ),
                                ),
                                const OutlinedDotIndicator(
                                  size: 10,
                                  color: Color(0xffdfdfdf),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              // color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Weight: ",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text("111",
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.bold)),
                                      const Text("kg"),
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Waist: ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text("62",
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.bold)),
                                      const Text("in")
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Date: ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text("31/05/2021",
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w300)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size10,
                ),
                SizedBox(
                  height: MySize.size30!,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Congratulation you lost ",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "16 ",
                      style: GoogleFonts.openSans(
                          color: const Color(0xff4885ED),
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Kg",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w300),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final ImagePicker _picker = ImagePicker();

  var waitDropDownValue = "in";
  var weightDropValue = "kg";
  var glassDropValue = "cup";

// ########################### BODY VIEW #####################
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: _getFloatingActionButton(),
        drawer: const CustomDrawer(),
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
        appBar: customAppBar(
          context,
          elevation: 0.5,
          // tabBar: TabBar(
          //   onTap: (index) {
          //     setState(() {
          //       _tabController.index = 2;
          //     });
          //   },
          //   controller: _tabController,
          //   labelPadding: EdgeInsets.only(left: MySize.size4),
          //   indicatorColor: Colors.transparent,
          //   labelColor: Colors.black,
          //   indicatorSize: TabBarIndicatorSize.label,
          //   unselectedLabelColor: Colors.black87,
          //   tabs: myTabs,
          // ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(
                    height: MySize.size30!,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MySize.size20!,
                      right: MySize.size20!,
                      bottom: MySize.size10!,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Ultimate Selfie",
                          style: GoogleFonts.openSans(fontSize: MySize.size15),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  // final XFile photo = await _picker.pickImage(
                                  //     source: ImageSource.camera);
                                  dialogForCamera();
                                  // print(photo);
                                },
                                child:
                                    Image.asset("assets/icons/camera_alt.png")),
                            SizedBox(
                              width: MySize.size10,
                            ),
                            GestureDetector(
                                onTap: () => showAlert2(context),
                                child: Image.asset(
                                    "assets/icons/image_compare.png"))
                          ],
                        )
                      ],
                    ),
                  ),
                  const OutlinedDotIndicator(),
                  TimelineTile(
                    oppositeContents: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('31/05/2021'),
                    ),
                    contents: Container(
                      width: MySize.size200!,
                      height: MySize.size250!,
                      padding: EdgeInsets.only(
                          left: MySize.size30!, right: MySize.size30!),
                      child: Column(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return const DetailScreen(
                                  counter: 0,
                                  imageUrl: "assets/images/kid1.jpg",
                                );
                              }));
                            },
                            child: Hero(
                              tag: "assets/images/kid1.jpg",
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset("assets/images/kid1.jpg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Weight:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 88",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Waist:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 46",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "in",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Lost:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 4",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    node: const TimelineNode(
                      indicator: OutlinedDotIndicator(),
                      startConnector: SolidLineConnector(),
                      endConnector: SolidLineConnector(),
                    ),
                  ),
                  TimelineTile(
                    oppositeContents: Container(
                      width: MySize.size200!,
                      height: MySize.size250,
                      padding: EdgeInsets.only(
                        left: MySize.size20!,
                        right: MySize.size20!,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            swapImage = !swapImage;
                          });
                        },
                        onLongPress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen(
                              counter: 1,
                              imageUrl: swapImage == false
                                  ? "assets/images/kid2.jpg"
                                  : "assets/images/kid3.jpg",
                            );
                          }));
                        },
                        child: Column(
                          children: [
                            swapImage == false
                                ? Stack(
                                    children: [
                                      Hero(
                                        tag: "assets/images/kid3.jpg1",
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                                "assets/images/kid3.jpg",
                                                width: MySize.size200!,
                                                height: MySize.size160,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Hero(
                                        tag: "assets/images/kid2.jpg1",
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                  "assets/images/kid2.jpg",
                                                  width: MySize.size200!,
                                                  height: MySize.size180,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      Hero(
                                        tag: "assets/images/kid2.jpg",
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                                "assets/images/kid2.jpg",
                                                width: MySize.size200!,
                                                height: MySize.size160,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Hero(
                                        tag: "assets/images/kid3.jpg",
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                  "assets/images/kid3.jpg",
                                                  width: MySize.size200!,
                                                  height: MySize.size180,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                            Row(
                              children: [
                                DDText(
                                  title: "Weight:",
                                  weight: FontWeight.w300,
                                ),
                                DDText(
                                  title: " 88",
                                  weight: FontWeight.w500,
                                ),
                                DDText(
                                  title: "Kg",
                                  weight: FontWeight.w300,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DDText(
                                  title: "Waist:",
                                  weight: FontWeight.w300,
                                ),
                                DDText(
                                  title: " 46",
                                  weight: FontWeight.w500,
                                ),
                                DDText(
                                  title: "in",
                                  weight: FontWeight.w300,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DDText(
                                  title: "Lost:",
                                  weight: FontWeight.w300,
                                ),
                                DDText(
                                  title: " 4",
                                  weight: FontWeight.w500,
                                ),
                                DDText(
                                  title: "Kg",
                                  weight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    contents: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('31/06/2021'),
                    ),
                    node: const TimelineNode(
                      indicator: OutlinedDotIndicator(),
                      startConnector: SolidLineConnector(),
                      endConnector: SolidLineConnector(),
                    ),
                  ),
                  TimelineTile(
                    oppositeContents: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('31/05/2021'),
                    ),
                    contents: Container(
                      width: MySize.size200!,
                      height: MySize.size250,
                      padding: EdgeInsets.only(
                          left: MySize.size30!, right: MySize.size30!),
                      child: Column(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return const DetailScreen(
                                  counter: 2,
                                  imageUrl: "assets/images/kid3.jpg",
                                );
                              }));
                            },
                            child: Hero(
                              tag: "assets/images/kid3.jpg2",
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset("assets/images/kid3.jpg",
                                      width: MySize.size200!,
                                      height: MySize.size160,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Weight:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 88",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Waist:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 46",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "in",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Lost:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 4",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    node: const TimelineNode(
                      indicator: OutlinedDotIndicator(),
                      startConnector: SolidLineConnector(),
                      endConnector: SolidLineConnector(),
                    ),
                  ),
                  TimelineTile(
                    oppositeContents: Container(
                      width: MySize.size200!,
                      height: MySize.size250,
                      padding: EdgeInsets.only(
                          right: MySize.size30!, left: MySize.size30!),
                      child: Column(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return const DetailScreen(
                                  counter: 3,
                                  imageUrl: "assets/images/kid4.jpg",
                                );
                              }));
                            },
                            child: Hero(
                              tag: "assets/images/kid4.jpg3",
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset("assets/images/kid4.jpg",
                                      width: MySize.size200!,
                                      height: MySize.size180,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Weight:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 88",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Waist:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 46",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "in",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Lost:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 4",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    contents: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('31/06/2021'),
                    ),
                    node: const TimelineNode(
                      indicator: OutlinedDotIndicator(),
                      startConnector: SolidLineConnector(),
                      endConnector: SolidLineConnector(),
                    ),
                  ),
                  TimelineTile(
                    oppositeContents: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('31/05/2021'),
                    ),
                    contents: Container(
                      width: MySize.size200!,
                      height: MySize.size250,
                      padding: EdgeInsets.only(
                          left: MySize.size30!, right: MySize.size30!),
                      child: Column(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return const DetailScreen(
                                  counter: 4,
                                  imageUrl: "assets/images/kid1.jpg",
                                );
                              }));
                            },
                            child: Hero(
                              tag: "assets/images/kid1.jpg4",
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset("assets/images/kid1.jpg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Weight:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 88",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Waist:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 46",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "in",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DDText(
                                title: "Lost:",
                                weight: FontWeight.w300,
                              ),
                              DDText(
                                title: " 4",
                                weight: FontWeight.w500,
                              ),
                              DDText(
                                title: "Kg",
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    node: const TimelineNode(
                      indicator: OutlinedDotIndicator(),
                      startConnector: SolidLineConnector(),
                      endConnector: SolidLineConnector(),
                    ),
                  ),
                ],
              ),
            ),
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
                    height: MySize.size100,
                    width: MySize.size100,
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
                          SizedBox(
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
                    height: MySize.size100,
                    width: MySize.size100,
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
                          SizedBox(
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
                    height: MySize.size100,
                    width: MySize.size100,
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
                          SizedBox(
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
                    height: MySize.size100,
                    width: MySize.size100,
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
                          SizedBox(
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
                      height: MySize.size10,
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
                            width: MySize.size100,
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
                      height: MySize.size10,
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
          child: Tooltip(
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
          child: Tooltip(
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
          child: Tooltip(
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
            //if no need to change the menu status
            dialogForWeight();
          },
          backgroundColor: Colors.white,
          child: Tooltip(
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
}

class DetailScreen extends StatefulWidget {
  final counter;
  final imageUrl;

  const DetailScreen({Key? key, this.imageUrl, this.counter}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: widget.imageUrl + widget.counter.toString(),
            child: Image.asset(
              widget.imageUrl,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

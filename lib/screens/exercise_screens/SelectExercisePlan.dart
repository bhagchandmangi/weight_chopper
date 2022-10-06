import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/AddExerciseCustomPlan.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class SelectExercisePlan extends StatefulWidget {
  const SelectExercisePlan({Key? key}) : super(key: key);

  @override
  _SelectExercisePlanState createState() => _SelectExercisePlanState();
}

class _SelectExercisePlanState extends State<SelectExercisePlan>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Today',
    ),
    const Tab(text: 'Diet'),
    const Tab(text: 'Exercise'),
    const Tab(text: 'Mind'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController!.animateTo(2);
  }

  // ignore: unused_field
  List<XFile>? _imageFileList;

// #################################### SETTER FOR IMAGE  ################################
  set _imageFile(XFile value) {
    _imageFileList = value == null ? null : [value];
  }

  final ImagePicker _picker = ImagePicker();
  // ignore: unused_field
  dynamic _pickImageError;

// #################################### GETTING IMAGE FROM GALLERY ################################

  Future getImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = pickedFile!;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int? initialIndex;

    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
        drawer: const CustomDrawer(),
        appBar: customAppBar(
          context,
          tabBar: TabBar(
            onTap: (index) {
              setState(() {
                _tabController!.index = 2;
              });
            },
            controller: _tabController!,
            labelPadding: EdgeInsets.only(left: MySize.size4!),
            indicatorColor: const Color(0xff4885ED),
            labelColor: const Color(0xff4885ED),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black87,
            tabs: myTabs,
          ),
        ),
        body: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(
                height: MySize.size26,
              ),
              textfieldSection(context),
              SizedBox(
                height: MySize.size20,
              ),
              headingView("Trending", MySize.size0),
              trendingGrid(context,
                  image1: 'assets/images/run2.png',
                  image2: 'assets/images/run1.png'),
              trendingGrid(context,
                  image1: 'assets/images/run3.png',
                  image2: 'assets/images/run2.png'),
              SizedBox(
                height: MySize.size20,
              ),
              headingView("Most Liked", MySize.size0),
              mostLikedGrid(initialIndex!, context),
            ],
          ),
        ),
      ),
    );
  }

  Container textfieldSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(
          color: Colors.grey[100]!,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Container(
              height: MySize.size63,
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffdfdfdf),
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: const Icon(
                      Icons.search,
                      color: Color(0xffafafaf),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color(0xffdfdfdf),
                      )),
                  // filled: true,
                  hintStyle: GoogleFonts.openSans(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  hintText: "Search..",
                  fillColor: Colors.white70,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                getImageFromGallery();
              },
              child: const Icon(
                Icons.ios_share,
                color: primaryColor,
                // size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container trendingGrid(BuildContext context, {image1, image2}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _showFoodDialog(
                    title: "Lorem", imageUrl: 'assets/images/run2.png');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.asset(
                        image1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Lorem",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              "10 min",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expanded(
          // Expanded(
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      image2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Lorem",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "10 min",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showFoodDialog({title, imageUrl}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              insetAnimationDuration: const Duration(seconds: 1),
              insetAnimationCurve: Curves.fastOutSlowIn,
              elevation: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.46,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.38,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imageUrl))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 20),
                              child: DDText(title: "Lorum"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddExerciseCustomPlan()));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 20.0, right: 20),
                                child:
                                    DDText(title: "Add", color: primaryColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container mostLikedGrid(int initialIndex, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // setState(() {});
                      // initialIndex = 1;
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => DietInnerTab(),
                      //   ),
                      // );
                    },
                    child: Image.asset(
                      'assets/images/diet1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Lorem",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "10 min",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   initialIndex = 1;
                      // });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (BuildContext context) => DietInnerTab()),
                      // );
                    },
                    child: Image.asset(
                      'assets/images/diet2.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Lorem",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "10 min",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget leftRightheading(left, iconName, right, route) {
    return Container(
      padding: EdgeInsets.only(
        left: MySize.size16!,
        right: MySize.size16!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DDText(
            title: left,
            size: MySize.size15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
            },
            child: Row(
              children: [
                Icon(
                  iconName,
                  size: 18,
                  color: primaryColor,
                ),
                DDText(
                  title: right,
                  size: MySize.size15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headingView(title, bottomPadding) {
    return Container(
      padding: EdgeInsets.only(left: MySize.size30!, bottom: bottomPadding),
      child: Row(
        children: [
          DDText(
            title: title,
            size: MySize.size15,
          ),
        ],
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/AddFoodScreen.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/CustomFoodInfo.dart';
import 'package:weightchopper_flutter_project/theme/TextStyles.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class SearchFood extends StatefulWidget {
  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  final ImagePicker _picker = ImagePicker();

  // ignore: unused_field
  String _scanBarcode = 'Unknown';
  // ignore: unused_field
  final TextEditingController _searchController = TextEditingController();

  // ignore: unused_field
  List<XFile>? _imageFileList;

// #################################### SETTER FOR IMAGE  ################################
  set _imageFile(XFile value) {
    _imageFileList = value == null ? null : [value];
  }

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

// #################################### GETTING IMAGE FROM CAMERA ################################

  Future getImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      setState(() {
        _imageFile = pickedFile!;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

// #################################### DIALOGUE FOR CHOOSING GALLERY OR CAMERA ################################

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
                  height: MySize.size20,
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
                  height: MySize.size10!,
                ),
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                ),
                Container(
                  child: Row(
                    children: [
                      TextButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(20)
                              // primary: Colors.transparent,

                              ),
                          icon: const Icon(FontAwesomeIcons.images),
                          onPressed: () async {
                            getImageFromGallery().then((value) {
                              Navigator.pop(context);
                            });
                          },
                          label: DDText(
                            title: "Choose From Gallery",
                          )),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    TextButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)
                            // primary: Colors.transparent,

                            ),
                        icon: const Icon(FontAwesomeIcons.camera),
                        onPressed: () async {
                          getImageFromCamera().then((value) {
                            Navigator.pop(context);
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

// #################################### FUNCTION FOR BARCODE ################################

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomStaticBottomNavigationBar(),
      drawer: const CustomDrawer(),
      appBar: customAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: darkGrey.withOpacity(0.1))),
                  child: headerView(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/catering.png",
                            width: MySize.size20,
                            height: MySize.size20,
                          ),
                          DDText(
                            title: " Custom Food",
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CustomFoodInfo();
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: DDText(
                          title: "Add Food",
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MySize.size20,
                ),
                listItemView(context),
                listItemView(context),
                listItemView(context),
                listItemView(context),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MySize.size10!, right: MySize.size10!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddFoodScreen();
                                }));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Salad",
                                    style: darkText14Px.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Russian Salad , 250 grams",
                                    style: lightText12Px.copyWith(
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "320",
                            style: darkText14Px.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MySize.size20,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/recent.png",
                        width: MySize.size20,
                        height: MySize.size20,
                      ),
                      DDText(
                        title: " Recent",
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size20,
                ),
                listItemView(context),
                listItemView(context),
                listItemView(context),
                listItemView(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listItemView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddFoodScreen();
        }));
      },
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MySize.size10!, right: MySize.size10!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Salad",
                        style:
                            darkText14Px.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Russian Salad , 250 grams",
                        style: lightText12Px.copyWith(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text(
                  "320",
                  style: darkText14Px.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MySize.size10!,
              right: MySize.size10!,
            ),
            child: const Divider(),
          ),
        ],
      ),
    );
  }

// ############################ BODY VIEW ################################

  Widget bodyView(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: darkColor.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(6)),
          child: ListView.separated(
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddFoodScreen();
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Salad",
                            style: darkText14Px.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Russian Salad , 250 grams",
                            style:
                                lightText12Px.copyWith(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "320",
                    style: darkText14Px.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            itemCount: 20,
            separatorBuilder: (ctx, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 1,
              color: darkColor.withOpacity(0.1),
            ),
          ),
        ),
      ),
    );
  }

// ################################# HEADER VIEW ############################

  Row headerView() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: lightText12Px,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: Colors.black45, width: 0.1)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: Colors.black45, width: 0.1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: Colors.black45, width: 0.1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: Colors.black45, width: 0.1)),
                suffixIcon: IconButton(
                  onPressed: () async {
                    // Obtain a list of the available cameras on the device.
                    dialogForCamera();
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                  color: Colors.black45,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black45,
                ),
                hintText: "Search for food"),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            scanBarcodeNormal();
          },
          child: Image.asset(
            "assets/icons/barcode-scanner.png",
            width: MySize.size30,
            height: MySize.size30,
          ),
        ),
      ],
    );
  }
}

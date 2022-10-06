import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/chat/ReceivedMessageScreen.dart';
import 'package:weightchopper_flutter_project/screens/chat/SentMessageScreen.dart';

class DetailChatScreen extends StatefulWidget {
  final title;

  const DetailChatScreen({Key? key, this.title}) : super(key: key);

  @override
  _DetailChatScreen createState() => _DetailChatScreen();
}

class _DetailChatScreen extends State<DetailChatScreen> {
  TextEditingController? textFieldController;

  final TextInputAction _textInputAction = TextInputAction.newline;

  @override
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();

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

  @override
  Widget build(BuildContext context) {
    var iconColor;
    var textFieldHintColor;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: MySize.size5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(""),
                      const Text(""),
                      const Text(""),
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size10!),
                        child: DDText(
                          title: widget.title ?? "",
                          size: MySize.size12,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 30,
                        child: const Icon(
                          Icons.person,
                          color: Color(0xffafafaf),
                          size: 40,
                        ),
                      ),
                      DDText(
                        title: "Staff",
                        size: MySize.size15,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(""),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Flexible(
              // flex: 8,
              flex: 7,
              child: SizedBox(
                height: double.infinity,
                // color: Colors.blue,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    children: const [
                      SentMessageScreen(
                          message:
                              "this is a random sentence a user can ask a question be contacting the 24/7 service"),
                      ReceivedMessageScreen(
                          message:
                              "Hello sir, how may I be of assistance to you? "),
                      SentMessageScreen(
                          message:
                              "Thank you for your patience, you are now connected with our staff!"),
                      ReceivedMessageScreen(message: "Please wait... "),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              // flex: 2,
              child: Container(
                height: 100,
                // color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(left: 0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            // IconButton(
                            //   padding: const EdgeInsets.all(0.0),
                            //   disabledColor: iconColor,
                            //   color: iconColor,
                            //   icon: Icon(Icons.insert_emoticon),
                            //   onPressed: () {},
                            // ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[100]!,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: TextField(
                                          controller: textFieldController,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          textInputAction: _textInputAction,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.all(3),
                                            hintText: 'Type a message',
                                            hintStyle: TextStyle(
                                              color: textFieldHintColor,
                                              fontSize: 16.0,
                                            ),
                                            counterText: '',
                                          ),
                                          onSubmitted: (String text) {
                                            // if(_textInputAction == TextInputAction.send) {
                                            //   _sendMessage();
                                            // }
                                          },
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          maxLength: 200,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      color: iconColor,
                                      icon: Icon(
                                        FontAwesomeIcons.paperclip,
                                        color: Colors.grey[300],
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        getImageFromGallery();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              color: iconColor,
                              icon: const Icon(
                                Icons.send,
                                color: primaryColor,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int offsetUnsentMessage = 0;
}

import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/auth/login_screen.dart';

import 'package:weightchopper_flutter_project/screens/chat/ChatBotScreen.dart';
import 'package:weightchopper_flutter_project/theme/TextStyles.dart';
import 'package:weightchopper_flutter_project/utils/Responsive.dart';
import 'package:weightchopper_flutter_project/widget/SizeConfig.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    SizeConfig().init(context);
    Responsive().setContext(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Lets get your journey started \ntowards a healthy life",
                  textAlign: TextAlign.center,
                  style: darkText18Px.copyWith(
                      fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ),
              Text(
                "Are you familiar with calorie tracker?",
                style: darkText16Px.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 4,
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.3,
                height: 30,
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => ChatBotScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    "No",
                    style: darkText12Px,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 2,
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.3,
                height: 30,
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) =>
                                const LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    "Yes",
                    style: darkText12Px,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "SIGN IN TO EXISTING ACCOUNT",
                    style: darkText12Px,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

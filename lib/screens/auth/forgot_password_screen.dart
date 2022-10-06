import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/utils/validation.dart';
import 'package:weightchopper_flutter_project/widget/custom_form_fields.dart';

import '../../theme/TextStyles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen();

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
                  style: lightText18Px.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: form,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFormFields.formFieldWithoutIcon(
                            hint: 'Email,Username or Password',
                            icon: const Icon(
                              Icons.email_outlined,
                              color: primaryColor,
                              size: 30,
                            ),
                            validator: (value) {
                              print(value);
                              return Validation.validateValue(
                                  value!, 'Email', true);
                            },
                            onChange: (val) {
                              return null;
                            },
                            onSaved: (val) {
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: 270,
                            child: Text(
                              'Please enter your email address or phone number to search for your account ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: darkText12Px,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '',
                                style: darkText12Px,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Center(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

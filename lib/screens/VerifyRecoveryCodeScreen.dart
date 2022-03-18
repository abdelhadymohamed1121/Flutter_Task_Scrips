// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../cache_Helper/Cache_helper.dart';
import '../utils/Constatnt.dart';
import 'ForgetScreen.dart';

class VerifyCodeSendEmailScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var verifyCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4f6f6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  defaultFormField(
                    controller: verifyCodeController,
                    validate: (value) {
                      String userData = CacheHelper.getData(key: 'userData');
                      var verificationCode = jsonDecode(userData)['verificationCode'].toString();
                      print(verificationCode);
                      if (value.isEmpty) {
                        return 'please enter verification Code';
                      } else if (verificationCode != verifyCodeController.text) {
                        return 'please enter correct verification Code';
                      }
                    },
                    prefix: Icons.alternate_email_outlined,
                    type: TextInputType.emailAddress,
                    label: 'verification Code',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 55.0),
                    textColor: Colors.white,
                    color: const Color(0xff05445E),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetScreen(),
                          ),
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xff05445E),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Send",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

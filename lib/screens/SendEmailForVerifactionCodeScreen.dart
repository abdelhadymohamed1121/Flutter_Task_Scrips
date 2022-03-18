// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../cache_Helper/Cache_helper.dart';
import '../utils/Constatnt.dart';
import 'VerifyRecoveryCodeScreen.dart';

class SendEmailScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

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
                    key: Key("emailSendEmailForVerification"),
                    controller: emailController,
                    validate: (value) {
                      String userData = CacheHelper.getData(key: 'userData');
                      var email = jsonDecode(userData)['email'].toString();
                      print(email);
                      if (value.isEmpty) {
                        return 'please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'please enter valid email';
                      } else if (email != emailController.text) {
                        return 'please enter correct email';
                      }
                    },
                    prefix: Icons.alternate_email_outlined,
                    type: TextInputType.emailAddress,
                    label: 'email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    key: Key("sendEmailButton"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 55.0),
                    textColor: Colors.white,
                    color: const Color(0xff05445E),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyCodeSendEmailScreen(),
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

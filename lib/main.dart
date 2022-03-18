// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'cache_Helper/Cache_helper.dart';
import 'screens/SendEmailForVerifactionCodeScreen.dart';
import 'screens/SignUpScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var access_token = CacheHelper.getData(key: 'access_token');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter task3',
      home: SignUpScreen(),
    );
  }
}
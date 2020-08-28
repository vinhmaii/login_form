import 'package:app_form222/main.dart';
import 'package:app_form222/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_generator.dart';
class ScreenHelper3 {
  // ignore: non_constant_identifier_names
  static dynamic gotoFormWidgets(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
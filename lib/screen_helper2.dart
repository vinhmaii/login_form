import 'package:app_form222/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_generator.dart';
class ScreenHelper2 {
  // ignore: non_constant_identifier_names
  static dynamic gotoSignIn(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}
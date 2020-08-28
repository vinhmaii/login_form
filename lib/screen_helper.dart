import 'package:app_form222/story_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_generator.dart';
import 'dart:core';
class ScreenHelper {
  // ignore: non_constant_identifier_names
  static gotoStoryGenerator(BuildContext context, {String user}) =>
     Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StoryGenerator(username: user)));
  
}

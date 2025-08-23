import 'package:flutter/material.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/add_post.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/home_screen.dart';
import 'package:simple_post_app_challenge/ui/views/pages/post_Details/post_Screen.dart';

class AppRoutes {
  // static const String initial = '/';
  static const String home = '/home';
  static const String addPost = '/add_post';
  static const String postDetail = '/postDetail';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      // initial: (context) => const Homescreen(),
      home: (context) => const Homescreen(),
      addPost: (context) => const Savepost(),
    };
  }

  static WidgetBuilder postDetailRoute(PostModel post, int index) {
    return (BuildContext context) => Postscreen(post: post, index: index);
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/constant/app_colors.dart';
import 'package:simple_post_app_challenge/core/constant/app_images.dart';
import 'package:simple_post_app_challenge/core/enum/request_type.dart';
import 'package:simple_post_app_challenge/core/network/network_utils.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/container_post.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/post_view.dart';

class Postscreen extends StatelessWidget {
  final PostModel post;
  final int index;
  const Postscreen({super.key, required this.post, required this.index});
  Future<void> deletePost(BuildContext context) async {
    NetworkUtil.sendRequest(
      type: RequestType.DELETE,
      url: "posts/1",
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: {"post": post, "index": index},
    ).then((response) {
      if (response != null) {
        final newPost = PostModel.fromJson(response);

        Navigator.pop(context, true);
      }
    });

    // final prefs = await SharedPreferences.getInstance();
    // List<String> posts = prefs.getStringList('posts') ?? [];
    // posts.removeAt(index);
    // await prefs.setStringList('posts', posts);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 19.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                BaseContainer(
                  icon: Icons.delete,
                  onIconTap: () => deletePost(context),
                  Text2: post.title,
                  Text3: post.body,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Album",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Image.asset(Appimage.network),
                SizedBox(height: 16.h),
                Image.asset(Appimage.digital),
                SizedBox(height: 16.h),
                Image.asset(Appimage.computer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

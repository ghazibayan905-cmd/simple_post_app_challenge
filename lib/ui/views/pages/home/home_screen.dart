import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/constant/app_colors.dart';
import 'package:simple_post_app_challenge/core/constant/app_images.dart';
import 'package:simple_post_app_challenge/core/constant/app_routes.dart';
import 'package:simple_post_app_challenge/core/enum/request_type.dart';
import 'package:simple_post_app_challenge/core/network/comment_model.dart';
import 'package:simple_post_app_challenge/core/network/network_utils.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/bottom_sheet.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/container_post.dart';
import 'package:simple_post_app_challenge/ui/views/pages/post_Details/post_Screen.dart';
import 'package:simple_post_app_challenge/ui/views/pages/add_post.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<PostModel> posts = [];
  List<CommentModel> comment = [];
  List<bool> expandContainers = [];
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    // final prefs = await SharedPreferences.getInstance();
    await NetworkUtil.sendRequest(
      type: RequestType.GET,
      url: "posts",
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    ).then((response) {
      if (response != null)
        if (response["statusCode"] == 200)
          for (Map<String, dynamic> post in response["response"]) {
            posts.add(PostModel.fromJson(post));
          }
      setState(() {
        // posts = prefs.getStringList('posts') ?? [];
        // print(posts.length);
        expandContainers = List.filled(posts.length, false);
        for (int i = 0; i < posts.length; i++) {
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              expandContainers[i] = true;
            });
          });
        }
      });
    });
  }

  Future<List<CommentModel>> getComments(int postId) async {
    final response = await NetworkUtil.sendRequest(
      type: RequestType.GET,
      url: "posts/$postId/comments",
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response != null) {
      final commentsJson = response["response"] as List<dynamic>;
      return commentsJson.map((c) => CommentModel.fromJson(c)).toList();
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 9.w),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  AppRoutes.addPost,
                );
                if (result == true) _loadPosts();
              },
              child: SvgPicture.asset(Appimage.create_note),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 188, 188, 189),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Appimage.socialhub)),
              SizedBox(height: 20.h),

              for (var i = 0; i < posts.length; i++) ...[
                CustomContainer(
                  width: expandContainers[i],

                  title: posts[i].title.toString(),
                  post: posts[i],
                  index: i,
                  body: posts[i].body ?? "no body",
                  onCommentPressed: () async {
                    final comments = await getComments(posts[i].id!);
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return BuildSheet(comments: comments);
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

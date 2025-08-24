import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/constant/app_images.dart';
import 'package:simple_post_app_challenge/core/enum/request_type.dart';
import 'package:simple_post_app_challenge/core/network/network_utils.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/add_postview.dart';

class Savepost extends StatefulWidget {
  const Savepost({super.key});

  @override
  State<Savepost> createState() => _SavepostState();
}

class _SavepostState extends State<Savepost> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();
  Future<void> _savePost() async {
    if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
      try {
        final response = await NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: "posts",
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: {"title": _titleController.text, "body": _bodyController.text},
        );

        if (response != null) {
          switch (response["statusCode"]) {
            case 200:
              final newPost = PostModel.fromJson(response["response"]);
              Navigator.pop(context, true);
              break;
            case 400:
              throw Exception(response["error"]);
            default:
              throw Exception("Unable to save post, please try again");
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("error occured $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 18.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(Appimage.socialhub)),
                SizedBox(height: 58.h),
                Text(
                  "Add new post",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),

                CustomTextField(
                  hintText: "Title",
                  maxLines: 1,
                  controller: _titleController,
                ),
                SizedBox(height: 14.h),
                CustomTextField(
                  hintText: "Body",
                  maxLines: 10,
                  controller: _bodyController,
                ),
                SizedBox(height: 44.h),

                ElevatedButton(
                  onPressed: _savePost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff30404D),
                    minimumSize: Size(392.w, 60.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Color(0xff13B493), width: 2),
                    ),
                  ),

                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
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

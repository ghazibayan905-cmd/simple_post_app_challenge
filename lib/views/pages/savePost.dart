import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/appimages.dart';
import 'package:simple_post_app_challenge/views/pages/home/widgets/savepostview.dart';

class Savepost extends StatefulWidget {
  const Savepost({super.key});

  @override
  State<Savepost> createState() => _SavepostState();
}

class _SavepostState extends State<Savepost> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();
  Future<void> _savePost() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> posts = prefs.getStringList("posts") ?? [];

    if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
      posts.add("${_titleController.text} : ${_bodyController.text}");
      await prefs.setStringList("posts", posts);

      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("الرجاء إدخال العنوان والمحتوى")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

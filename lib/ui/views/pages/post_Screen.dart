import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/constant/app_colors.dart';
import 'package:simple_post_app_challenge/core/constant/app_images.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/container_post.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/post_view.dart';

class Postscreen extends StatelessWidget {
  final String post;
  final int index;
  const Postscreen({super.key, required this.post, required this.index});
  Future<void> deletePost(BuildContext context) async {
    
    final prefs = await SharedPreferences.getInstance();
    List<String> posts = prefs.getStringList('posts') ?? [];
    posts.removeAt(index);
    await prefs.setStringList('posts', posts);
    Navigator.pop(context, true);
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
                  Text2: post,  
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/constant/app_colors.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/post_Details/post_Screen.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String body;
  final IconData? icon;
  final PostModel? post;
  final int? index;
  final bool width;
  final Function()? onEnd;
  final VoidCallback? onCommentPressed;
  const CustomContainer({
    Key? key,
    required this.title,
    required this.body,
    this.icon,
    this.post,
    this.index,
    required this.width,
    this.onEnd,
    this.onCommentPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: post != null && index != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Postscreen(post: post!, index: index!),
                ),
              );
            }
          : null,
      child: AnimatedContainer(
        alignment: Alignment.topLeft,
        onEnd: onEnd,
        duration: Duration(seconds: 5),
        curve: Curves.bounceIn,
        padding: EdgeInsets.all(20.w),
        width: width ? 600.w : 0,
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, color: Colors.red, size: 30),
              ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 4,
              softWrap: true,
            ),
            SizedBox(height: 15.h),
            Text(
              body,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
              softWrap: true,
              maxLines: 4,
              overflow: TextOverflow.fade,
            ),
            SizedBox(height: 15.h),
            ElevatedButton(
              onPressed: onCommentPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text("Comment"),
            ),
          ],
        ),
      ),
    );
  }
}

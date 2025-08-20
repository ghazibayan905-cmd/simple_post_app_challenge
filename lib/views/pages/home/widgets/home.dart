import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/appColors.dart';
import 'package:simple_post_app_challenge/views/pages/postScreen.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String body;
  final IconData? icon;
  final String? post;
  final int? index;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.body,
    this.icon,
    this.post,
    this.index,
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
      child: Container(
        padding: EdgeInsets.only(left: 7.w, right: 10.w),
        width: 387.w,
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.background,
        ),
        child: Column(
          children: [
            if (icon != null) Icon(icon, color: Colors.red, size: 30),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
            SizedBox(height: 15.h),
            Text(
              body,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

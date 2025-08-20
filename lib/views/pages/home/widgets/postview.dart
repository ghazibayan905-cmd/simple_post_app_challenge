import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/appColors.dart';

class BaseContainer extends StatelessWidget {
  final String? Text2;
  final String? Text3;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onIconTap;
  const BaseContainer({
    this.Text2,
    this.icon,
    this.padding,
    this.Text3,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7.w, right: 10.w),
      width: 387.w,
      height: 256.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.background,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 335.w, top: 13.h),
            child: IconButton(
              icon: Icon(icon, color: Colors.red),
              onPressed: onIconTap,
            ),
          ),
          SizedBox(height: 13),
          Text(
            Text2 ?? "",
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
          SizedBox(height: 15.h),
          Text(
            Text3 ?? "",

            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

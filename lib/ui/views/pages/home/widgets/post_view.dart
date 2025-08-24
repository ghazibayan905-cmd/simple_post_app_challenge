import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/constant/app_colors.dart';

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
      padding: padding ?? EdgeInsets.all(8.w),
      width: double.infinity,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [Colors.teal[50]!, Colors.teal[100]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                icon ?? Icons.close,
                color: Colors.redAccent,
                size: 28.sp,
              ),
              onPressed: onIconTap,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            Text2 ?? "",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.teal[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                Text3 ?? "",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

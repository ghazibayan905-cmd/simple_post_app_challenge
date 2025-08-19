import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/appColors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.w, right: 32.w),
      child: Container(
        padding: EdgeInsets.only(left: 7.w, right: 10.w, top: 15.h),
        width: 387.w,
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.background,
        ),
        child: Column(
          children: [
            Text(
              "sunt aut facere repellat provident occaecatiexcepturi optio reprehenderit",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
            SizedBox(height: 15.h),
            Text(
              "sunt aut quia et suscipit suscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totam nostrum rerum est ",

              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/appimages.dart';
import 'package:simple_post_app_challenge/views/pages/home/widgets/savepostview.dart';

class Savepost extends StatelessWidget {
  const Savepost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Appimage.socialhub)),
              SizedBox(height: 58.h),
              Text(
                "Add new post",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),

              CustomTextField(hintText: "title", maxLines: 1),
              SizedBox(height: 14.h),
              CustomTextField(hintText: "Body", maxLines: 10),
              SizedBox(height: 44.h),

              ElevatedButton(
                onPressed: () {},
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
    );
  }
}

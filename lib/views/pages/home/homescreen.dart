import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_post_app_challenge/core/appColors.dart';
import 'package:simple_post_app_challenge/core/appimages.dart';
import 'package:simple_post_app_challenge/views/pages/home/widgets/home.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 188, 189),
      appBar: AppBar(
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 9.w),
            child: SvgPicture.asset(Appimage.create_note),
          ),
        ],

        backgroundColor: const Color.fromARGB(255, 188, 188, 189),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset(Appimage.socialhub)),
              SizedBox(height: 20.h),
              CustomContainer(),
              SizedBox(height: 22.h),
              CustomContainer(),
              SizedBox(height: 22.h),
              CustomContainer(),
              SizedBox(height: 22.h),
              CustomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

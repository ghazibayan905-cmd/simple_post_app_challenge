import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/appColors.dart';
import 'package:simple_post_app_challenge/core/appimages.dart';
import 'package:simple_post_app_challenge/views/pages/home/widgets/home.dart';
import 'package:simple_post_app_challenge/views/pages/home/widgets/postview.dart';

class Postscreen extends StatelessWidget {
  const Postscreen({super.key});

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

                  Text2:
                      "sunt aut facere repellat provident occaecat iexcepturi optio repreh enderit",
                  Text3:
                      "sunt aut quia et suscipit suscipit recusandae consequuntur expedita et cumreprehende ritmolestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto repellat provident occaecatiexcepturi optio reprehenderit",
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

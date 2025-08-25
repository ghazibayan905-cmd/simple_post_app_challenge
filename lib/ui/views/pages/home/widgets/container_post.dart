import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  LinearGradient getGradient(int index) {
    List<LinearGradient> gradients = [
      LinearGradient(colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)]),
      LinearGradient(
        colors: [Color(0xFFFFF3E0), Color.fromARGB(255, 245, 228, 203)],
      ),
      LinearGradient(colors: [Color(0xFFEDE7F6), Color(0xFFD1C4E9)]),
      LinearGradient(colors: [Color(0xFFF1F8E9), Color(0xFFDCE775)]),
      LinearGradient(colors: [Color(0xFFFFEBEE), Color(0xFFFFCDD2)]),
    ];
    return gradients[index % gradients.length];
  }

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
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        onEnd: onEnd,
        padding: EdgeInsets.all(18.w),
        width: width ? 600.w : double.infinity,
        decoration: BoxDecoration(
          gradient: index != null ? getGradient(index!) : getGradient(0),
          borderRadius: BorderRadius.circular(20.r),
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
            if (icon != null)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.teal[800], size: 26.sp),
                ),
              ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 19.sp,
                color: Colors.teal[900],
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Text(
              body,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[800]),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onCommentPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                ),
                child: const Text("Comment"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

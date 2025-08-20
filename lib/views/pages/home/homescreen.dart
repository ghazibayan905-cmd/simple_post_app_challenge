import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/appColors.dart';
import 'package:simple_post_app_challenge/core/appimages.dart';
import 'package:simple_post_app_challenge/views/pages/home/widgets/home.dart';
import 'package:simple_post_app_challenge/views/pages/postScreen.dart';
import 'package:simple_post_app_challenge/views/pages/savePost.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      posts = prefs.getStringList('posts') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 9.w),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Savepost()),
                );
                if (result == true) _loadPosts();
              },
              child: SvgPicture.asset(Appimage.create_note),
            ),
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

            
              CustomContainer(
                title: "sunt aut facere repellat provident occaecatiexcepturi optio reprehenderit",
                body: "mn",
              ),
              SizedBox(height: 22.h),
              
              SizedBox(height: 22.h),
              for (var i = 0; i < posts.length; i++) ...[
                CustomContainer(title: posts[i], post: posts[i], index: i,body: posts[i], ),
                SizedBox(height: 16.h),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

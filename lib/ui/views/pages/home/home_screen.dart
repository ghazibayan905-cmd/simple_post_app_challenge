import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_post_app_challenge/core/constant/app_colors.dart';
import 'package:simple_post_app_challenge/core/constant/app_images.dart';
import 'package:simple_post_app_challenge/core/constant/app_routes.dart';
import 'package:simple_post_app_challenge/core/enum/request_type.dart';
import 'package:simple_post_app_challenge/core/network/network_utils.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/container_post.dart';
import 'package:simple_post_app_challenge/ui/views/pages/post_Screen.dart';
import 'package:simple_post_app_challenge/ui/views/pages/add_post.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<PostModel> posts = [];
  List<bool> expandContainers = [];
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    // final prefs = await SharedPreferences.getInstance();

    await NetworkUtil.sendRequest(
      type: RequestType.GET,
      url: "posts",
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    ).then((response) {
      // if(response!=null)
      // if(response["statusCode"]==200)
      for (Map<String, dynamic> post in response["response"]) {
        posts.add(PostModel.fromJson(post));
      }

      setState(() {
        // posts = prefs.getStringList('posts') ?? [];
        print(posts.length);
        expandContainers = List.filled(posts.length, false);
        for (int i = 0; i < posts.length; i++) {
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              expandContainers[i] = true;
            });
          });
        }
      });
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
                final result = await Navigator.pushNamed(
                  context,
                  AppRoutes.addPost,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Appimage.socialhub)),
              SizedBox(height: 20.h),

              CustomContainer(
                width: true,
                title:
                    "sunt aut facere repellat provident occaecatiexcepturi optio reprehenderit",
                body: "mn",
              ),
              SizedBox(height: 22.h),

              SizedBox(height: 22.h),

              for (var i = 0; i < posts.length; i++) ...[
                CustomContainer(
                  width: expandContainers[i],

                  title: posts[i].title!,
                  post: posts[i].title,
                  index: i,
                  body: posts[i].body!,
                ),
                SizedBox(height: 16.h),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

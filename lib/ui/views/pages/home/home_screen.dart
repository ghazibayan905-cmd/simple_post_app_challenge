import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_post_app_challenge/core/constant/app_images.dart';
import 'package:simple_post_app_challenge/core/constant/app_routes.dart';
import 'package:simple_post_app_challenge/core/enum/request_type.dart';
import 'package:simple_post_app_challenge/core/network/comment_model.dart';
import 'package:simple_post_app_challenge/core/network/network_utils.dart';
import 'package:simple_post_app_challenge/core/post_model.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/bottom_sheet.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/widgets/container_post.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<PostModel> posts = [];
  List<CommentModel> comment = [];
  List<bool> expandContainers = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: "posts",
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (response != null) {
        if (response["statusCode"] == 200) {
          for (Map<String, dynamic> post in response["response"]) {
            posts.add(PostModel.fromJson(post));
          }
        }

        setState(() {
          expandContainers = List.filled(posts.length, false);
          for (int i = 0; i < posts.length; i++) {
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                setState(() {
                  expandContainers[i] = true;
                });
              }
            });
          }
        });
      }
    } on SocketException {
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("خطأ: $e")));
    }
  }

  Future<List<CommentModel>> getComments(int postId) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: "posts/$postId/comments",
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (response != null) {
        switch (response["statusCode"]) {
          case 200:
            final commentsJson = response["response"] as List<dynamic>;
            return commentsJson.map((c) => CommentModel.fromJson(c)).toList();

          case 400:
            throw Exception(response["error"]);

          default:
            throw Exception("Unable to load comments, please try again");
        }
      }

      return [];
    } catch (e) {
      throw Exception(" arror an occured: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                expandedHeight: 220.h,
                backgroundColor: Colors.transparent,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // حساب نسبة التمرير بين الحد الأقصى والأدنى
                    double maxHeight = 220.h;
                    double minHeight = kToolbarHeight;
                    double percent =
                        ((constraints.maxHeight - minHeight) /
                                (maxHeight - minHeight))
                            .clamp(0.0, 1.0);

                    double logoSize =
                        80.h + (40.h * percent); 

                    return ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(40.r),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(
                                255,
                                168,
                                168,
                                168,
                              ).withOpacity(0.3),
                              const Color.fromARGB(
                                255,
                                194,
                                192,
                                192,
                              ).withOpacity(0.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: logoSize,
                                child: Image.asset(
                                  Appimage.socialhub,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16.h,
                              right: 16.w,
                              child: InkWell(
                                onTap: () async {
                                  final result = await Navigator.pushNamed(
                                    context,
                                    AppRoutes.addPost,
                                  );
                                  if (result == true) _loadPosts();
                                },
                                borderRadius: BorderRadius.circular(50.r),
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    Appimage.create_note,
                                    height: 30.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 20.h)),

              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: CustomContainer(
                      width: expandContainers[index],
                      title: posts[index].title.toString(),
                      post: posts[index],
                      index: index,
                      body: posts[index].body ?? "no body",
                      onCommentPressed: () async {
                        final comments = await getComments(posts[index].id!);
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return BuildSheet(comments: comments);
                          },
                        );
                      },
                    ),
                  );
                }, childCount: posts.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

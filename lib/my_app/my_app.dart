import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app_challenge/core/constant/app_routes.dart';
import 'package:simple_post_app_challenge/ui/views/pages/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(216, 225, 233, 0),
                Color.fromRGBO(47, 61, 74, 0),
                Color.fromRGBO(47, 61, 74, 0),
                Color.fromRGBO(12, 181, 149, 0.34),
                Color.fromRGBO(12, 181, 149, 0.47),
                Color.fromRGBO(12, 181, 149, 0.47),
                Color.fromRGBO(12, 181, 149, 0.40),
              ],
            ),
          ),

          child: child,
        );
      },

      child: MaterialApp(
        routes: AppRoutes.getRoutes(context),
        initialRoute: AppRoutes.home ,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const Homescreen(),
      ),
    );
  }
}

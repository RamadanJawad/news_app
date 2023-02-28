import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/launch_controller.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LaunchController());
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Spacer(),
        Image.asset(
          "images/logo.png",
          height: 150.h,
          width: double.infinity,
        ),
        Spacer(),
        CupertinoActivityIndicator(
          color: Colors.grey,
        )
      ]),
    );
  }
}

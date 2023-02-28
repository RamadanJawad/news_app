import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/widget/custom_bottom.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottom(),
      body: GetBuilder<HomeController>(
          builder: (controller) => controller.screens[controller.currentIndex]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:news_app/model/news.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:news_app/view/screen/bottom/business_screen.dart';
import 'package:news_app/view/screen/bottom/health_screen.dart';
import 'package:news_app/view/screen/bottom/sport_screen.dart';
import 'package:news_app/view/screen/bottom/techno_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  List<News> data = [];
  var currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    HapticFeedback.lightImpact();
    update();
  }

  List<IconData> listOfIcons = [
    Icons.sports,
    Icons.business,
    Icons.health_and_safety,
    Icons.computer_rounded,
  ];

  List<String> listOfStrings = [
    'Sport',
    'Business',
    'Health',
    'Techno',
  ];

  List<Widget> screens = [
    SportScreen(),
    BusinessScreen(),
    HealthScreen(),
    TechnoScreen()
  ];

  List<Color> colors = [
    Colors.blue,
    Colors.orangeAccent,
    Colors.green,
    Colors.blueGrey
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

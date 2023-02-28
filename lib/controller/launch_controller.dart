import 'package:get/get.dart';
import 'package:news_app/view/screen/home_screen.dart';

class LaunchController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => HomeScreen(),transition: Transition.leftToRight);
    });
  }
}

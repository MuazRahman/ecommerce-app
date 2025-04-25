import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/auth_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:ecommerce_app/features/common/controller/category_controller.dart';
import 'package:ecommerce_app/features/common/controller/home_slider_controller.dart';
import 'package:ecommerce_app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(MainBottomNavBarController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.lazyPut(() => VerifyOTPController());
  }
}

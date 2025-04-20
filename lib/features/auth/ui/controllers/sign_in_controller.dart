import 'package:ecommerce_app/app/app_urls.dart';
import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInRequestModel signInRequestModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.signInUrl, body: signInRequestModel.toJson());
    if (response.isSuccess) {
      // Save User Data
      UserModel userModel = UserModel.fromJson(response.responseData!['data']['user']);
      // Save User Token
      String accessToken = response.responseData!['data']['token'];
      Logger logger = Logger();
      logger.i("Access Token: $accessToken");
      await Get.find<AuthController>().saveUserData(accessToken, userModel);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}

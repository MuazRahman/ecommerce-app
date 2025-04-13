import 'package:ecommerce_app/app/app_urls.dart';
import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp_model.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get verifyOTPInProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyOTP(VerifyOTPModel verifyOTPModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.verifyOTPUrl, body: verifyOTPModel.toJson());
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}

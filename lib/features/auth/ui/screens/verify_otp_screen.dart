import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/core/widgets/show_snack_bar_message.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp_model.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  static const String name = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final VerifyOTPController _verifyOTPController = Get.find<VerifyOTPController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                AppLogo(),
                SizedBox(height: 24),
                Text(
                  context.localization.enterYourOtpCode,
                  style: textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  context.localization.aFourDigitCodeHasBeenSent,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: 16),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _otpTEController,
                  appContext: context,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if ((value?.length ?? 0) < 4) {
                      return 'Enter your otp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapVerifyOTPButton,
                  child: Text(context.localization.verify),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyOTPButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOTP();
    }
  }

  Future<void> _verifyOTP() async {
    VerifyOTPModel verifyOTPModel = VerifyOTPModel(email: widget.email, otp: _otpTEController.text);
    Logger logger = Logger();
    logger.i(widget.email);
    final bool isSuccess = await _verifyOTPController.verifyOTP(verifyOTPModel);
    if (isSuccess) {
      showSnackBarMessage(context, 'Otp has been verified. Please login');
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=> false);
    }
    else {
      showSnackBarMessage(context, _verifyOTPController.errorMessage!, true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }
}

import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(context.localization.verify),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }
}

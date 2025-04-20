import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/core/widgets/centered_circular_progress_indicatior.dart';
import 'package:ecommerce_app/core/widgets/show_snack_bar_message.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_app/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final SignInController _signInController = Get.find<SignInController>();
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
                  context.localization.welcomeBack,
                  style: textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  context.localization.enterYourEmailAndPassword,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                  controller: _emailTEController,
                ),
                SizedBox(height: 8),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                  controller: _passwordTEController,
                ),
                SizedBox(height: 16),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    return Visibility(
                      visible: _signInController.inProgress == false,
                      replacement: CenteredCircularProgressIndicatior(),
                      child: ElevatedButton(
                        onPressed: _onTapSignInButton,
                        child: Text(context.localization.signIn),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()..onTap = _onTapSignUpButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignInButton() async {
    if (_formKey.currentState!.validate()) {
      SignInRequestModel signInRequestModel = SignInRequestModel(
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text);
      final bool isSuccess = await _signInController.signIn(signInRequestModel);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, MainBottomNavBarScreen.name, (value)=> false);
      }
      else {
        showSnackBarMessage(context, _signInController.errorMessage!, true);
      }
    }
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    // _signInController.dispose();
  }
}

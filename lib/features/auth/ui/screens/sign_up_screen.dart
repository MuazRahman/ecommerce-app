import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = TextTheme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildForm(textTheme),
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 24),
            AppLogo(),
            SizedBox(height: 24),
            Text(
              context.localization.registerYourAccount,
              style: textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              context.localization.getStartedWithYourDetails,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 32),
            TextFormField(
              controller: _emailTEController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: context.localization.email),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _firstNameTEController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: context.localization.firstName,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _lastNameTEController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: context.localization.lastName,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _phoneTEController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: context.localization.phone),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _passwordTEController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: context.localization.password,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _deliveryAddressTEController,
              textInputAction: TextInputAction.next,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: context.localization.deliveryAddress,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onTapSignUpButton,
              child: Text(context.localization.signUp),
            ),
            SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.themeColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _deliveryAddressTEController.dispose();
  }
}

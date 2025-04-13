import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/core/widgets/centered_circular_progress_indicatior.dart';
import 'package:ecommerce_app/core/widgets/show_snack_bar_message.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_model.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final SignUpController signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildForm(textTheme),
        ),
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
            validator: (String? value) {
              String email = value ?? '';
              if (!EmailValidator.validate(email)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localization.firstName,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your first name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localization.lastName,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your last name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _phoneTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: context.localization.phone),
            validator: (String? value) {
              String phoneNumber = value ?? '';
              RegExp regExp = RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$');
              if (regExp.hasMatch(phoneNumber) == false) {
                return 'Enter a valid phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localization.password,
            ),
            validator: (String? value) {
              if ((value?.isEmpty ?? true) || value!.length <6) {
                return 'Enter a password more than 6 letters';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _deliveryAddressTEController,
            textInputAction: TextInputAction.next,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: context.localization.deliveryAddress,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your delivery address';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          GetBuilder<SignUpController>(
            builder: (controller) {
              return Visibility(
                visible: controller.signUpInProgress == false,
                replacement: CenteredCircularProgressIndicatior(),
                child: ElevatedButton(
                  onPressed: _onTapSignUpButton,
                  child: Text(context.localization.signUp),
                ),
              );
            }
          ),
          SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: 'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.themeColor,
                  ),
                  recognizer:
                      TapGestureRecognizer()..onTap = _onTapSignInButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
          email: _emailTEController.text.trim(),
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          phone: _phoneTEController.text.trim(),
          password: _passwordTEController.text,
          deliveryAddress: _deliveryAddressTEController.text.trim(),
      );
      final isSuccess = await signUpController.signUp(signUpModel);
      if (isSuccess) {
        Navigator.pushNamed(context, VerifyOtpScreen.name, arguments: _emailTEController.text.trim());
      } else {
        showSnackBarMessage(context, signUpController.errorMessage!, true);
      }
    }
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

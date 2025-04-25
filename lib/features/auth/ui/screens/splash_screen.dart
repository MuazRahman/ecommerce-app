
import 'package:ecommerce_app/core/widgets/centered_circular_progress_indicatior.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/auth_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_app/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_app/app/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  final AuthController authController = Get.find<AuthController>();

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2),);
    // bool isLoggedIn = await authController.isUserLoggedIn();
    // if (isLoggedIn){
      Navigator.pushNamedAndRemoveUntil(context, MainBottomNavBarScreen.name, (predicate)=> false);
    // }
    // else {
    //   Navigator.pushReplacementNamed(context, SignInScreen.name);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CenteredCircularProgressIndicatior(),
              SizedBox(height: 16,),
              Text('${AppLocalizations.of(context)!.version} ${AppConfig.currentAppVersion}')
            ],
          ),
        ),
      ),
    );
  }
}

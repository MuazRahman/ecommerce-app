import 'package:ecommerce_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_app/app/app_config.dart';
import 'package:flutter/material.dart';

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

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2),);
    Navigator.pushReplacementNamed(context, SignInScreen.name);
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
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text('${AppLocalizations.of(context)!.helloWorld} Version ${AppConfig.currentAppVersion}')
            ],
          ),
        ),
      ),
    );
  }
}

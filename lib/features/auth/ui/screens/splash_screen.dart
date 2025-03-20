import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_app/app/app_config.dart';
import 'package:ecommerce_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset(AssetsPath.logoSvg, width: 120,),
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

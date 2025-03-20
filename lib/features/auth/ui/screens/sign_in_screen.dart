import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            AppLogo(),
            SizedBox(height: 24),
            Text('Welcome back', style: textTheme.titleLarge),
            SizedBox(height: 8),
            Text(
              'Enter your email and password',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 16),
            TextFormField(decoration: InputDecoration(hintText: 'Email')),
            SizedBox(height: 8),
            TextFormField(decoration: InputDecoration(hintText: 'Password')),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text("Log in")),
          ],
        ),
      ),
    );
  }
}

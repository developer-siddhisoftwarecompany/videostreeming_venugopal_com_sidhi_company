import 'package:flutter/material.dart';
import 'screen/onboarding_screen.dart';
import 'screen/sign_in_screen.dart';
import 'screen/sign_up_screen.dart';
import 'screen/forgot_password_screen.dart';
import 'screen/otp_verification_screen.dart';
import 'screen/reset_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding & Auth App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.white54),
        ),
      ),

      home: const OnboardingScreen(),

      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/otp': (context) => const OTPVerificationScreen(),
        '/reset': (context) => const ResetPasswordScreen(),
      },
    );
  }
}

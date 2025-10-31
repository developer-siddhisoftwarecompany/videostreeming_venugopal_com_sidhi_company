import 'package:flutter/material.dart';
import 'screen/onboarding_screen.dart';
import 'screen/sign_in_screen.dart';
import 'screen/sign_up_screen.dart';
import 'screen/forgot_password_screen.dart';
import 'screen/otp_verification_screen.dart';
import 'screen/reset_password_screen.dart';
import 'screen/home_screen.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seekho App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFF0E0E10),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
          surface: const Color(0xFF0E0E10),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.white54),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/otp': (context) => const OTPVerificationScreen(),
        '/reset': (context) => const ResetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text(
              'Page not found 🧐',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }
}
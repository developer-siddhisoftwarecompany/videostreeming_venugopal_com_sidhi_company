import 'package:flutter/material.dart';
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
        brightness: Brightness.dark,

        // Main colors
        primaryColor: const Color(0xFFEB7A28),
        scaffoldBackgroundColor: const Color(0xFF0C0F12),

        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFEB7A28),
          secondary: Color(0xFFEB7A28),
          surface: Color(0xFF0C0F12),
          background: Color(0xFF0C0F12),
        ),

        // Input Field Style
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.black26,
          hintStyle: TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
          prefixIconColor: Colors.white54,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.white24,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFEB7A28), width: 1.2),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),

        // Text Themes
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
          bodyMedium: TextStyle(
            color: Colors.white60,
            fontSize: 14,
          ),
        ),

        // Button Style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEB7A28),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      // ----------------- THEME END -----------------

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
        builder: (context) => const //

        Scaffold(
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

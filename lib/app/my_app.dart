import 'package:flutter/material.dart';
import 'package:tnb_dlks_mobile/features/auth/screens/login_screen.dart';
import 'package:tnb_dlks_mobile/features/dashboard/screens/dashboard_screen.dart';
import 'package:tnb_dlks_mobile/features/root/root_screen.dart';
import 'package:tnb_dlks_mobile/features/splash/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate splash delay

    // TODO: Replace with real auth check
    final isLoggedIn = false; // simulate not logged in

    setState(() {
      _isLoading = false;
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DLKS Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: _isLoading
          ? const SplashScreen()
          : _isLoggedIn
              ? const RootScreen()
              : const LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tnb_dlks_mobile/features/root/root_screen.dart';

import '../auth/screens/login_screen.dart';
import '../dashboard/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _mainController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _bounceAnimation;
  late Animation<double> _bgOpacity;

  late AudioPlayer _player;
  int _dotIndex = 0;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeIn),
    );

    _bounceAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.elasticOut),
    );

    _bgOpacity = Tween<double>(begin: 0.0, end: 0.4).animate(_mainController);

    _mainController.forward();
    _startDotAnimation();
    _playSound();
    _checkSessionAndNavigate();
  }

  void _startDotAnimation() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return false;
      setState(() {
        _dotIndex = (_dotIndex + 1) % 4;
      });
      return true;
    });
  }

  Future<void> _playSound() async {
    _player = AudioPlayer();
    await _player.play(AssetSource('sounds/splash_sound.mp3'));
  }

  Future<void> _checkSessionAndNavigate() async {
    final session = Supabase.instance.client.auth.currentSession;

    await Future.delayed(const Duration(milliseconds: 1800));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) =>
            session != null ? const RootScreen() : const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _mainController.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dotStyle = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    );

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Fade-in background image
              AnimatedBuilder(
                animation: _bgOpacity,
                builder: (_, __) {
                  return Opacity(
                    opacity: _bgOpacity.value,
                    child: Image.asset(
                      'assets/images/splash_bg.jpg',
                      fit: BoxFit.cover,
                      width: 1.sw,
                      height: 1.sh,
                    ),
                  );
                },
              ),

              // Animated logo & text
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _bounceAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(Icons.electric_bolt_rounded, size: 48.sp, color: Colors.blue),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'DLKS Mobile',
                        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Field Work Management',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      SizedBox(height: 40.h),

                      // Loading dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (i) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            width: 10.w,
                            height: 10.w,
                            decoration: dotStyle.copyWith(
                              color: i == _dotIndex ? Colors.blue : Colors.blue.shade200,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // Footer text
              Positioned(
                bottom: 30.h,
                left: 0,
                right: 0,
                child: Text(
                  'Connecting Work. Powering Progress.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

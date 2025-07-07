import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/services/auth_service.dart';
import '../core/services/app_state_manager.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/root/root_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthService, AppStateManager>(
      builder: (context, authService, appStateManager, child) {
        // Show loading screen while initializing
        if (!appStateManager.isInitialized || appStateManager.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Show appropriate screen based on auth state
        if (authService.isLoggedIn) {
          return const RootScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../features/splash/splash_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/purchase/screens/purchase_order_main.dart';
import '../features/work/screens/work_management_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DLKS Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: const SplashScreen(), // 👈 Start here
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/purchase-order': (context) => const PurchaseOrderMainScreen(),
        '/work-management': (context) => const WorkManagementScreen(), // Make sure this exists
      },
    );
  }
}

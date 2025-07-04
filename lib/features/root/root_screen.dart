import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tnb_dlks_mobile/features/dashboard/screens/dashboard_screen.dart';
import 'package:tnb_dlks_mobile/features/purchase/screens/purchase_order_main.dart';
import 'package:tnb_dlks_mobile/features/work/screens/work_management_screen.dart';
import 'package:tnb_dlks_mobile/features/notifications/screens/notifications_screen.dart';
import 'package:tnb_dlks_mobile/features/auth/screens/login_screen.dart';
import 'package:tnb_dlks_mobile/features/profile/screens/view_profile_screen.dart';
import 'package:tnb_dlks_mobile/features/settings/screens/view_settings_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    PurchaseOrderMainScreen(),
    WorkManagementScreen(),
  ];

  final List<String> _titles = const [
    'Dashboard',
    'Purchase Order',
    'Work Management',
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
    );
  }

  void _showProfileMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewSettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(_titles[_currentIndex], style: TextStyle(fontSize: 18.sp)),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none, size: 20.sp),
          onPressed: _navigateToNotifications,
        ),
        GestureDetector(
          onTap: _showProfileMenu,
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CircleAvatar(
              radius: 16.r,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/100'),
            ),
          ),
        ),
      ],
    ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Purchase Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build_circle),
            label: 'Work Management',
          ),
        ],
      ),
    );
  }
}

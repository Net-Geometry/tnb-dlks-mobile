import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tnb_dlks_mobile/features/dashboard/screens/dashboard_screen.dart';
import 'package:tnb_dlks_mobile/features/purchase/screens/purchase_order_main.dart';
import 'package:tnb_dlks_mobile/features/work/screens/work_management_screen.dart';
import 'package:tnb_dlks_mobile/features/notifications/screens/notifications_screen.dart';
import 'package:tnb_dlks_mobile/features/profile/screens/view_profile_screen.dart';
import 'package:tnb_dlks_mobile/features/settings/screens/view_settings_screen.dart';
import 'package:tnb_dlks_mobile/core/services/auth_service.dart';

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
    'Home',
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
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = authService.user;
    
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // User Info Header
            Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: const NetworkImage('https://i.pravatar.cc/100'),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.userMetadata?['display_name'] ?? user?.email?.split('@').first ?? 'User',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          user?.email ?? 'No email',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
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
            const Divider(),
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
          Consumer<AuthService>(
            builder: (context, authService, child) {
              return TextButton(
                onPressed: authService.isLoading ? null : () async {
                  Navigator.pop(context);
                  final success = await authService.signOut();
                  if (success && mounted) {
                    // Navigation will be handled automatically by AppWrapper
                    // No need to manually navigate
                  } else if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(authService.errorMessage ?? 'Failed to log out'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: authService.isLoading
                    ? SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      )
                    : const Text('Log Out', style: TextStyle(color: Colors.red)),
              );
            },
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
            label: 'Home',
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

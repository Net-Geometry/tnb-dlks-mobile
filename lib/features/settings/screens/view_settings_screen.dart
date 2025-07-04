import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewSettingsScreen extends StatefulWidget {
  const ViewSettingsScreen({super.key});

  @override
  State<ViewSettingsScreen> createState() => _ViewSettingsScreenState();
}

class _ViewSettingsScreenState extends State<ViewSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _darkMode = false;
  String _selectedLanguage = 'English';
  
  final List<String> _languages = ['English', 'Bahasa Malaysia', 'Mandarin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(fontSize: 18.sp)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Section
            _sectionTitle('Notifications'),
            _switchTile(
              'Enable Notifications',
              _notificationsEnabled,
              (value) => setState(() => _notificationsEnabled = value),
            ),
            _switchTile(
              'Push Notifications',
              _pushNotifications,
              (value) => setState(() => _pushNotifications = value),
            ),
            _switchTile(
              'Email Notifications',
              _emailNotifications,
              (value) => setState(() => _emailNotifications = value),
            ),
            
            SizedBox(height: 24.h),
            
            // Appearance Section
            _sectionTitle('Appearance'),
            _switchTile(
              'Dark Mode',
              _darkMode,
              (value) => setState(() => _darkMode = value),
            ),
            
            // Language Selection
            Card(
              child: ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                subtitle: Text(_selectedLanguage),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => _showLanguageDialog(),
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // Account Section
            _sectionTitle('Account'),
            _settingsTile(
              'Privacy Policy',
              Icons.privacy_tip,
              () => _showComingSoon('Privacy Policy'),
            ),
            _settingsTile(
              'Terms of Service',
              Icons.description,
              () => _showComingSoon('Terms of Service'),
            ),
            _settingsTile(
              'Help & Support',
              Icons.help,
              () => _showComingSoon('Help & Support'),
            ),
            _settingsTile(
              'About',
              Icons.info,
              () => _showAboutDialog(),
            ),
            
            SizedBox(height: 24.h),
            
            // Data Section
            _sectionTitle('Data'),
            _settingsTile(
              'Clear Cache',
              Icons.cleaning_services,
              () => _showClearCacheDialog(),
            ),
            _settingsTile(
              'Export Data',
              Icons.download,
              () => _showComingSoon('Export Data'),
            ),
            
            SizedBox(height: 32.h),
            
            // App Version
            Center(
              child: Text(
                'Version 2.0.0',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _switchTile(String title, bool value, Function(bool) onChanged) {
    return Card(
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
    );
  }

  Widget _settingsTile(String title, IconData icon, VoidCallback onTap) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _languages.map((language) {
            return RadioListTile<String>(
              title: Text(language),
              value: language,
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() => _selectedLanguage = value!);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About DLKS Mobile'),
        content: const Text(
          'DLKS Mobile - Field Work Management System\n\n'
          'Version 2.0.0\n\n'
          'Developed by TNB for efficient field work management and purchase order processing.\n\n'
          '© 2025 Tenaga Nasional Berhad',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache'),
        content: const Text(
          'This will clear all cached data including offline content. Are you sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cache cleared successfully!')),
              );
            },
            child: const Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature feature coming soon!')),
    );
  }
}

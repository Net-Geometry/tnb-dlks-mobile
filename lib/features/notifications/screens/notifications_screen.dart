import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(fontSize: 18.sp)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _notificationCard(
            title: 'PO Approved',
            message: 'Purchase Order PO-2024-001 has been approved',
            time: '2 hours ago',
            isRead: false,
          ),
          _notificationCard(
            title: 'Work Assignment',
            message: 'New work assignment has been assigned to you',
            time: '5 hours ago',
            isRead: false,
          ),
          _notificationCard(
            title: 'System Update',
            message: 'The system will be updated tonight at 11:00 PM',
            time: '1 day ago',
            isRead: true,
          ),
          _notificationCard(
            title: 'PO Reminder',
            message: 'Purchase Order PO-2024-002 is pending approval',
            time: '2 days ago',
            isRead: true,
          ),
          _notificationCard(
            title: 'Welcome',
            message: 'Welcome to DLKS Mobile Field Work Management',
            time: '1 week ago',
            isRead: true,
          ),
        ],
      ),
    );
  }

  Widget _notificationCard({
    required String title,
    required String message,
    required String time,
    required bool isRead,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isRead ? Colors.grey.shade300 : Colors.blue,
          child: Icon(
            Icons.notifications,
            color: isRead ? Colors.grey : Colors.white,
            size: 20.sp,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              message,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              time,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
        trailing: !isRead
            ? Container(
                width: 8.w,
                height: 8.h,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              )
            : null,
      ),
    );
  }
}

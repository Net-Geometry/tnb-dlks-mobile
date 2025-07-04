import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkManagementDetailScreen extends StatelessWidget {
  const WorkManagementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Management Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Work Code: WM-2024-019',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Permit Type: Electrical Maintenance',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Date Issued: Jan 12, 2024',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Divider(),
              SizedBox(height: 8.h),
              Text(
                'Assigned Team:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: const [
                  CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=1')),
                  SizedBox(width: 8),
                  CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=2')),
                  SizedBox(width: 8),
                  CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=3')),
                  SizedBox(width: 8),
                  Text("+2 more"),
                ],
              ),
              SizedBox(height: 16.h),
              Divider(),
              SizedBox(height: 16.h),
              Text(
                'Work Description',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Routine inspection and repair of electrical panels in Sector C. Expected to complete within 3 days.',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the summary or next screen
                  },
                  child: const Text('Start Work'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

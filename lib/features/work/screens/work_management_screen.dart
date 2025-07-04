import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkManagementScreen extends StatelessWidget {
  const WorkManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _summaryBox('Total', '1', Icons.assignment_outlined),
                _summaryBox('Issued', '1', Icons.insert_drive_file_outlined),
                _summaryBox('Acknowledged', '0', Icons.check_circle_outline, Colors.green),
                _summaryBox('Revisions', '0', Icons.edit_outlined, Colors.orange),
              ],
            ),
            SizedBox(height: 16.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by AMK number, contractor, or location',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(child: DropdownButtonFormField(items: [], onChanged: (_) {}, decoration: InputDecoration(hintText: 'All Types'))),
                SizedBox(width: 8.w),
                Expanded(child: DropdownButtonFormField(items: [], onChanged: (_) {}, decoration: InputDecoration(hintText: 'All Status'))),
                SizedBox(width: 8.w),
                Icon(Icons.download),
              ],
            ),
            SizedBox(height: 16.h),
            _workCard(),
          ],
        ),
      ),
    );
  }

  Widget _summaryBox(String title, String count, IconData icon, [Color? color]) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 24.sp, color: color ?? Colors.blue),
          Text(count, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _workCard() {
    return Card(
      margin: EdgeInsets.only(top: 12.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('AMK-2024-001', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                SizedBox(width: 8.w),
                Chip(label: Text('AMK', style: TextStyle(fontSize: 10.sp))),
                SizedBox(width: 4.w),
                Chip(label: Text('Issued', style: TextStyle(fontSize: 10.sp))),
              ],
            ),
            SizedBox(height: 12.h),
            _infoRow(Icons.business, 'PowerTech Solutions Sdn Bhd'),
            _infoRow(Icons.date_range, '20/01/2024 – 15/03/2024'),
            _infoRow(Icons.settings, 'Underground Cable Work, Substation Installation'),
            _infoRow(Icons.calendar_today, '15/01/2024'),
            _infoRow(Icons.location_on, 'Jalan Ampang, KL – Substation Alpha Upgrade'),
            SizedBox(height: 8.h),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye),
              label: Text('View Details'),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, size: 16.sp),
          SizedBox(width: 8.w),
          Expanded(child: Text(text, style: TextStyle(fontSize: 12.sp))),
        ],
      ),
    );
  }
}

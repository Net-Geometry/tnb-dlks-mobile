import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseOrderWorkSummaryScreen extends StatelessWidget {
  const PurchaseOrderWorkSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with PO number and status
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PO-2024-001',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Electrical Installation Project',
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'Approved',
                      style: TextStyle(color: Colors.green, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Amount + Job description
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RM 45,750',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    Text(
                      'PO Amount',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Work Description',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Complete electrical installation and testing for Building A renovation project including wiring, panel installation, and safety systems.',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Job Scope',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    _scopeItem('Electrical Installation'),
                    _scopeItem('Testing & Commissioning'),
                    _scopeItem('Safety System Setup'),
                    SizedBox(height: 12.h),
                    Text(
                      'Requested By',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Facilities Management Department',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Work Summary Section
              Text(
                'Work Summary',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.h),
              _workCard('01', 'ELE-001', 'Main Panel Installation'),
              _workCard('02', 'ELE-002', 'Wiring Installation'),
              _workCard('03', 'ELE-003', 'Testing & Commissioning'),
              SizedBox(height: 20.h),

              // Notes
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'All electrical work must comply with local safety standards. Final inspection scheduled for next week. Contractor has been notified about safety protocols.',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 24.h),

              // Total completed + download button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Completed Value',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  Text(
                    'RM 34,312.50',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('Download Summary'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scopeItem(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.green, size: 16.sp),
          SizedBox(width: 6.w),
          Text(text, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _workCard(String index, String code, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$index  $code', style: TextStyle(color: Colors.blue, fontSize: 12.sp)),
          SizedBox(height: 4.h),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp)),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined, size: 16),
                  label: const Text('View LKH'),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Create LKH'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

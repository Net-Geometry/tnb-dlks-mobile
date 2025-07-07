import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkManagementScreen extends StatelessWidget {
  const WorkManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Summary Cards in 2x2 Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 1.8, // Increased aspect ratio for more height
                      children: [
                        _summaryBox('Total', '12', Icons.assignment_outlined, Colors.blue),
                        _summaryBox('Issued', '5', Icons.insert_drive_file_outlined, Colors.orange),
                        _summaryBox('Acknowledged', '4', Icons.check_circle_outline, Colors.green),
                        _summaryBox('Revisions', '3', Icons.edit_outlined, Colors.red),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    
                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search by AMK number, contractor, or location',
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    
                    // Filter Row - Responsive layout
                    LayoutBuilder(
                      builder: (context, constraints) {
                        bool isTablet = constraints.maxWidth > 600;
                        if (isTablet) {
                          // Tablet layout - all in one row
                          return Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: Colors.grey.shade200),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'All Types',
                                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                                    ),
                                    items: const [],
                                    onChanged: (_) {},
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: Colors.grey.shade200),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'All Status',
                                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                                    ),
                                    items: const [],
                                    onChanged: (_) {},
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(color: Colors.blue.shade200),
                                ),
                                child: Icon(Icons.download, color: Colors.blue.shade600, size: 20.sp),
                              ),
                            ],
                          );
                        } else {
                          // Mobile layout - stacked layout for better fit
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(color: Colors.grey.shade200),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'All Types',
                                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                                        ),
                                        items: const [],
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(color: Colors.grey.shade200),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'All Status',
                                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                                        ),
                                        items: const [],
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Expanded(child: Container()), // Spacer
                                  Container(
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(color: Colors.blue.shade200),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.download, color: Colors.blue.shade600, size: 16.sp),
                                        SizedBox(width: 4.w),
                                        Text(
                                          'Export',
                                          style: TextStyle(
                                            color: Colors.blue.shade600,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            // Work Cards List - Responsive layout
            SliverPadding(
              padding: EdgeInsets.all(16.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _workCard(index),
                  childCount: 5, // Multiple work cards for better demonstration
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount(context),
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: _getChildAspectRatio(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 2 : 1; // 2 columns for tablet, 1 for mobile
  }

  double _getChildAspectRatio(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 1.0 : 0.8; // Adjusted ratios for better layout
  }

  Widget _summaryBox(String title, String count, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: color, size: 18.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            count,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 2.h),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 9.sp,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  Widget _workCard(int index) {
    // Sample data for different cards
    final workData = [
      {
        'id': 'AMK-2024-001',
        'company': 'PowerTech Solutions Sdn Bhd',
        'period': '20/01/2024 – 15/03/2024',
        'work': 'Underground Cable Work, Substation Installation',
        'date': '15/01/2024',
        'location': 'Jalan Ampang, KL – Substation Alpha Upgrade',
        'type': 'AMK',
        'status': 'Issued',
        'typeColor': Colors.blue,
        'statusColor': Colors.orange,
      },
      {
        'id': 'AMK-2024-002',
        'company': 'ElectroMax Engineering Sdn Bhd',
        'period': '25/01/2024 – 20/03/2024',
        'work': 'Transformer Installation, Cable Testing',
        'date': '20/01/2024',
        'location': 'Petaling Jaya, Selangor – Industrial Zone B',
        'type': 'AMK',
        'status': 'Acknowledged',
        'typeColor': Colors.blue,
        'statusColor': Colors.green,
      },
      {
        'id': 'AMK-2024-003',
        'company': 'MegaWatt Solutions Sdn Bhd',
        'period': '10/02/2024 – 10/04/2024',
        'work': 'Distribution Panel Upgrade, Wiring',
        'date': '05/02/2024',
        'location': 'Shah Alam, Selangor – Commercial Complex',
        'type': 'AMK',
        'status': 'Pending',
        'typeColor': Colors.blue,
        'statusColor': Colors.amber,
      },
      {
        'id': 'AMK-2024-004',
        'company': 'VoltTech Engineering Sdn Bhd',
        'period': '15/02/2024 – 15/04/2024',
        'work': 'High Voltage Cable Installation',
        'date': '10/02/2024',
        'location': 'Kuala Lumpur – City Center Project',
        'type': 'AMK',
        'status': 'Completed',
        'typeColor': Colors.blue,
        'statusColor': Colors.grey,
      },
      {
        'id': 'AMK-2024-005',
        'company': 'ProElectric Solutions Sdn Bhd',
        'period': '20/02/2024 – 20/04/2024',
        'work': 'Switchgear Installation, Testing',
        'date': '15/02/2024',
        'location': 'Cyberjaya, Selangor – Tech Park',
        'type': 'AMK',
        'status': 'Revision',
        'typeColor': Colors.blue,
        'statusColor': Colors.red,
      },
    ];

    final data = workData[index % workData.length];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Expanded(
                child: Text(
                  data['id'] as String,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: (data['typeColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  data['type'] as String,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: data['typeColor'] as Color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: (data['statusColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  data['status'] as String,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: data['statusColor'] as Color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          
          // Info Rows
          _infoRow(Icons.business, data['company'] as String),
          _infoRow(Icons.date_range, data['period'] as String),
          _infoRow(Icons.settings, data['work'] as String),
          _infoRow(Icons.calendar_today, data['date'] as String),
          _infoRow(Icons.location_on, data['location'] as String),
          
          SizedBox(height: 16.h),
          
          // Action Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye, size: 16.sp),
              label: Text('View Details', style: TextStyle(fontSize: 14.sp)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18.sp,
            color: Colors.grey.shade600,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade700,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

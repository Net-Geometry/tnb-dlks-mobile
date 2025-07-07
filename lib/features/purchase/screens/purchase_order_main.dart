import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseOrderMainScreen extends StatefulWidget {
  const PurchaseOrderMainScreen({super.key});

  @override
  State<PurchaseOrderMainScreen> createState() => _PurchaseOrderMainScreenState();
}

class _PurchaseOrderMainScreenState extends State<PurchaseOrderMainScreen> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _poList = [
    {
      'number': 'PO-2024-001',
      'company': 'ABC Manufacturing Co.',
      'amount': '\$15,250.00',
      'date': 'Jan 15, 2024',
      'status': 'Pending',
      'statusColor': Colors.amber,
    },
    {
      'number': 'PO-2024-002',
      'company': 'XYZ Supplies Ltd.',
      'amount': '\$8,750.00',
      'date': 'Jan 12, 2024',
      'status': 'Approved',
      'statusColor': Colors.green,
    },
    {
      'number': 'PO-2024-003',
      'company': 'Tech Solutions Inc.',
      'amount': '\$22,100.00',
      'date': 'Jan 10, 2024',
      'status': 'In Progress',
      'statusColor': Colors.blue,
    },
    {
      'number': 'PO-2024-004',
      'company': 'Global Parts Co.',
      'amount': '\$5,980.00',
      'date': 'Jan 8, 2024',
      'status': 'Completed',
      'statusColor': Colors.grey,
    },
    {
      'number': 'PO-2024-005',
      'company': 'Industrial Equipment Ltd.',
      'amount': '\$31,450.00',
      'date': 'Jan 5, 2024',
      'status': 'Pending',
      'statusColor': Colors.amber,
    },
  ];

  final List<String> filters = ['All', 'Pending', 'Approved', 'In Progress'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
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
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by PO name or number...',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(filters.length, (index) {
                        final selected = index == _selectedTab;
                        return Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: FilterChip(
                            label: Text(filters[index]),
                            selected: selected,
                            onSelected: (_) => setState(() => _selectedTab = index),
                            selectedColor: Colors.blue.shade100,
                            backgroundColor: Colors.grey.shade100,
                            labelStyle: TextStyle(
                              color: selected ? Colors.blue.shade700 : Colors.grey.shade700,
                              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            // PO List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: _poList.length,
                itemBuilder: (context, index) {
                  final po = _poList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    po['number'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    po['company'],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                    color: po['statusColor'].withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    po['status'],
                                    style: TextStyle(
                                      color: po['statusColor'],
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  po['date'],
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        // Amount
                        Text(
                          po['amount'],
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: Icon(Icons.remove_red_eye, size: 16.sp),
                                label: Text('View Details', style: TextStyle(fontSize: 12.sp)),
                                onPressed: () {},
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
                            SizedBox(width: 12.w),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.summarize, size: 16.sp),
                                label: Text('Summary', style: TextStyle(fontSize: 12.sp)),
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.blue.shade600,
                                  side: BorderSide(color: Colors.blue.shade600),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by PO name or number...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(filters.length, (index) {
                    final selected = index == _selectedTab;
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: ChoiceChip(
                        label: Text(filters[index]),
                        selected: selected,
                        onSelected: (_) => setState(() => _selectedTab = index),
                        selectedColor: Colors.blue,
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _poList.length,
                  itemBuilder: (context, index) {
                    final po = _poList[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 12.h),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        po['number'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Text(
                                        po['company'],
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: po['statusColor'].withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: Text(
                                        po['status'],
                                        style: TextStyle(
                                          color: po['statusColor'],
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      po['date'],
                                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              po['amount'],
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('View Details'),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Work Summary'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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

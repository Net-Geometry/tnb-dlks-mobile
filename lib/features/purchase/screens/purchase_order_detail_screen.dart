import 'package:flutter/material.dart';

class PurchaseOrderDetailsScreen extends StatelessWidget {
  const PurchaseOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PO-2024-001"),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text("Approved", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAmountCard(),
          const SizedBox(height: 24),
          const Text("Work Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildWorkItem("01", "ELE-001", "Main Panel Installation"),
          _buildWorkItem("02", "ELE-002", "Wiring Installation"),
          _buildWorkItem("03", "ELE-003", "Testing & Commissioning"),
          const SizedBox(height: 16),
          _buildNoteSection(),
          const SizedBox(height: 16),
          _buildTotalCompleted(),
        ],
      ),
    );
  }

  Widget _buildAmountCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text("RM 45,750", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
          const SizedBox(height: 4),
          const Text("PO Amount", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          const Text("Work Description", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Complete electrical installation and testing for Building A renovation project including wiring, panel installation, and safety systems."),
          const SizedBox(height: 12),
          const Text("Job Scope", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.check, color: Colors.green, size: 20),
              SizedBox(width: 6),
              Text("Electrical Installation"),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.check, color: Colors.green, size: 20),
              SizedBox(width: 6),
              Text("Testing & Commissioning"),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.check, color: Colors.green, size: 20),
              SizedBox(width: 6),
              Text("Safety System Setup"),
            ],
          ),
          const SizedBox(height: 12),
          const Text("Requested By", style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("Facilities Management Department"),
        ],
      ),
    );
  }

  Widget _buildWorkItem(String index, String code, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 14, child: Text(index, style: const TextStyle(fontSize: 12))),
              const SizedBox(width: 12),
              Text(code, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                  label: const Text("View LKH"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Create LKH"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNoteSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: const Text(
        "All electrical work must comply with local safety standards. Final inspection scheduled for next week. Contractor has been notified about safety protocols.",
      ),
    );
  }

  Widget _buildTotalCompleted() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Total Completed Value", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("RM 34,312.50", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text("Download Summary"),
          ),
        ),
      ],
    );
  }
}

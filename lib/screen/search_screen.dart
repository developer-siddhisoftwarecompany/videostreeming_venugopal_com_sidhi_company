import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchFilters = [
      "Services",
      "Schemes",
      "Legal Gym",
      "Digital Barkat Guide",
      "Earning",
      "YouTube"
    ];

    final categories = [
      {'icon': Icons.account_balance, 'title': 'Sarkari Kaam'},
      {'icon': Icons.play_circle_fill, 'title': 'Youtube'},
      {'icon': Icons.work_history, 'title': 'Part-time'},
      {'icon': Icons.camera_alt, 'title': 'Youtube'},
      {'icon': Icons.bar_chart, 'title': 'Stock Market'},
      {'icon': Icons.translate, 'title': 'English Speaking'},
      {'icon': Icons.business_center, 'title': 'Business'},
      {'icon': Icons.phone_android, 'title': 'Mobile Tricks'},
      {'icon': Icons.attach_money, 'title': 'Finance'},
      {'icon': Icons.thumb_up, 'title': 'Success'},
      {'icon': Icons.monitor_heart, 'title': 'Health'},
      {'icon': Icons.school, 'title': 'Education'},
      {'icon': Icons.feed, 'title': 'News'},
      {'icon': Icons.gavel, 'title': 'Crime'},
      {'icon': Icons.work, 'title': 'Career'},
      {'icon': Icons.badge, 'title': 'Govt Job'},
      {'icon': Icons.memory, 'title': 'Technology'},
      {'icon': Icons.palette, 'title': 'Art & Craft'},
      {'icon': Icons.fitness_center, 'title': 'Fitness'},
      {'icon': Icons.sports_basketball, 'title': 'Sports'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E10),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Sarkari',
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon:
            const Icon(Icons.search, color: Colors.white54),
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Everyone is Searching",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: searchFilters
                  .map((filter) => Chip(
                label: Text(filter),
                backgroundColor: const Color(0xFF2C2C2C),
                labelStyle: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
              ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  "All Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2636),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category['icon'] as IconData,
                          color: Colors.white, size: 30),
                      const SizedBox(height: 10),
                      Text(
                        category['title'] as String,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
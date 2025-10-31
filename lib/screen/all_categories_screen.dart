import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          children: [
            Icon(Icons.local_fire_department, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              "All Categories",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
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
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = [
      {'image': 'assets/Sarkari_Kaam.png', 'title': 'Sarkari Kaam'},
      {'image': 'assets/Youtube.png', 'title': 'Youtube'},
      {'image': 'assets/Part_Time.png', 'title': 'Part-time'},
      {'image': 'assets/Instagram.png', 'title': 'Instagram'},
      {'image': 'assets/Stock_Market.png', 'title': 'Stock Market'},
      {'image': 'assets/English_Speaking.png', 'title': 'English Speaking'},
      {'image': 'assets/Business.png', 'title': 'Business'},
      {'image': 'assets/Mobile_Tricks.png', 'title': 'Mobile Tricks'},
      {'image': 'assets/Finance.png', 'title': 'Finance'},
      {'image': 'assets/Success.png', 'title': 'Success'},
      {'image': 'assets/Health.png', 'title': 'Health'},
      {'image': 'assets/Education.png', 'title': 'Education'},
      {'image': 'assets/News.png', 'title': 'News'},
      {'image': 'assets/Crime.png', 'title': 'Crime'},
      {'image': 'assets/Career.png', 'title': 'Career'},
      {'image': 'assets/Govt_Job.png', 'title': 'Govt Job'},
      {'image': 'assets/Technology.png', 'title': 'Technology'},
      {'image': 'assets/Art_Craft.png', 'title': 'Art & Craft'},
      {'image': 'assets/Fitness.png', 'title': 'Fitness'},
      {'image': 'assets/Sports.png', 'title': 'Sports'},
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
            childAspectRatio: 1.5, // You might need to adjust this
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final imagePath = category['image'] as String;
            final title = category['title'] as String;

            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2E2636),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ---!! UPDATE !! ---
                  // Replaced Icon with Image.asset
                  Image.asset(
                    imagePath,
                    height: 40, // Adjust size as needed
                    width: 40,  // Adjust size as needed
                    color: Colors.white, // This will tint your PNG white
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback icon if image fails to load
                      return const Icon(Icons.image_not_supported,
                          color: Colors.white54, size: 30);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
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
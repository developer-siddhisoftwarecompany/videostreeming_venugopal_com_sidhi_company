import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'image': 'assets/Sarkari_Kaam.svg', 'title': 'Sarkari Kaam'},
      {'image': 'assets/Youtube.svg', 'title': 'Youtube'},
      {'image': 'assets/Part_Time.svg', 'title': 'Part-time'},
      {'image': 'assets/Instagram.svg', 'title': 'Instagram'},
      {'image': 'assets/Stock_Market.svg', 'title': 'Stock Market'},
      {'image': 'assets/English_Speaking.svg', 'title': 'English Speaking'},
      {'image': 'assets/Business.svg', 'title': 'Business'},
      {'image': 'assets/Mobile_Tricks.svg', 'title': 'Mobile Tricks'},
      {'image': 'assets/Finance.svg', 'title': 'Finance'},
      {'image': 'assets/Success.svg', 'title': 'Success'},
      {'image': 'assets/Health.svg', 'title': 'Health'},
      {'image': 'assets/Education.svg', 'title': 'Education'},
      {'image': 'assets/News.svg', 'title': 'News'},
      {'image': 'assets/Crime.svg', 'title': 'Crime'},
      {'image': 'assets/Career.svg', 'title': 'Career'},
      {'image': 'assets/Govt_Job.svg', 'title': 'Govt Job'},
      {'image': 'assets/Technology.svg', 'title': 'Technology'},
      {'image': 'assets/Art_Craft.svg', 'title': 'Art & Craft'},
      {'image': 'assets/Fitness.svg', 'title': 'Fitness'},
      {'image': 'assets/Sports.svg', 'title': 'Sports'},
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
            final item = categories[index];

            return Material(
              color: const Color(0xFF2E2636),
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: Colors.orange.withOpacity(0.25),
                highlightColor: Colors.orange.withOpacity(0.15),
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item['image']!,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'plus_screen.dart';
import 'trending_section.dart';
import 'my_library_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pop(context);
      return;
    }
    setState(() => _selectedIndex = index);

    Widget page;
    if (index == 1) {
      page = const PlusScreen();
    } else if (index == 2) {
      page = const TrendingScreen();
    } else {
      page = const MyLibraryScreen();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    ).then((_) {
      setState(() => _selectedIndex = 0);
    });
  }

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
        backgroundColor: const Color(0xFF0E0E10),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Sarkari',
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: const Icon(Icons.search, color: Colors.white54),
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
              children: searchFilters.map(
                    (filter) {
                  return Material(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      splashColor: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text(
                          filter,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
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

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white24,
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2636),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            category['image']!,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category['title']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFF0E0E10),
        color: const Color(0xFF18181B),
        buttonBackgroundColor: Colors.orange,
        height: 70,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.add_box, size: 30, color: Colors.white),
          Icon(CupertinoIcons.flame_fill, size: 30, color: Colors.white),
          Icon(Icons.video_library, size: 30, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
        animationDuration: Duration(milliseconds: 300),
      ),
    );
  }
}

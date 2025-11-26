import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'sarkari_kam.dart';
import 'plus_screen.dart';
import 'trending_section.dart';
import 'my_library_screen.dart';
import 'video_detail_screen.dart';
import 'search_screen.dart';
import 'all_categories_screen.dart';
import 'sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() => _selectedIndex = index);
      return;
    }

    Widget page;
    if (index == 1) {
      page = const PlusScreen();
    } else if (index == 2) {
      page = const TrendingScreen();
    } else {
      page = const MyLibraryScreen();
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => page)).then((_) {
      setState(() => _selectedIndex = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'image': 'assets/Free_Videos.svg', 'title': 'Free Videos'},
      {'image': 'assets/Sarkari_Kaam.svg', 'title': 'Sarkari Kaam'},
      {'image': 'assets/Youtube.svg', 'title': 'Youtube'},
      {'image': 'assets/Part_Time.svg', 'title': 'Part Time'},
      {'image': 'assets/Instagram.svg', 'title': 'Instagram'},
      {'image': 'assets/View_All.svg', 'title': 'View All'},
    ];

    final topVideos = [
      'assets/video1.png',
      'assets/video2.png',
      'assets/video3.png',
      'assets/video4.png',
    ];

    final sarkariList = [
      'assets/sarkari1.png',
      'assets/sarkari3.png',
      'assets/sarkari4.png',
    ];

    final youtubeList = [
      'assets/yt1.png',
      'assets/yt2.png',
      'assets/yt3.png',
      'assets/yt3.png',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),

      drawer: _buildAppDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "Seekho",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                splashColor: Colors.orange.withOpacity(0.2),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SearchScreen()));
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.white54),
                      SizedBox(width: 12),
                      Text('Search',
                          style:
                          TextStyle(color: Colors.white54, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];

                return Material(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    splashColor: Colors.orange.withOpacity(0.25),
                    onTap: () {
                      if (item['title'] == 'Sarkari Kaam') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SarkariKamScreen()));
                      } else if (item['title'] == 'View All') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AllCategoriesScreen()));
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(item['image']!, height: 40, width: 40),
                        const SizedBox(height: 6),
                        Text(item['title']!,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: "Top Videos"),
            buildVideoRow(topVideos, "Top Video"),
            const SizedBox(height: 18),
            const SectionTitle(title: "Sarkari Kaam", viewAll: true),
            buildVideoRow(sarkariList, "Sarkari Kaam"),
            const SizedBox(height: 18),
            const SectionTitle(title: "YouTube", viewAll: true),
            buildVideoRow(youtubeList, "YouTube Video"),
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
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget buildVideoRow(List<String> videos, String titlePrefix) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: videos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              splashColor: Colors.orange.withOpacity(0.25),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoDetailScreen(
                      videoTitle: "$titlePrefix ${index + 1}",
                      videoDate: "10-10-2025",
                      videoDuration: "12:30 Mins",
                      videoDescription:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      mainVideoThumbnail: videos[index],
                      relatedVideos: [
                        {
                          'thumbnail': 'assets/sarkari1.png',
                          'title': 'Related Video 1',
                          'date': '12-04-2025',
                          'duration': '20:28'
                        },
                        {
                          'thumbnail': 'assets/sarkari2.png',
                          'title': 'Related Video 2',
                          'date': '10-03-2025',
                          'duration': '15:30'
                        },
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(videos[index]), fit: BoxFit.cover),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Drawer _buildAppDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF1C1C1E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF2C2C2E),
            padding: const EdgeInsets.only(left: 20, bottom: 30, top: 60),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.person,
                      color: Colors.white, size: 40),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Seekho User",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text("user@gmail.com",
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                )
              ],
            ),
          ),

          _drawerItem(Icons.home, "Home", () {
            Navigator.pop(context);
          }),

          _drawerItem(Icons.search, "Search", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SearchScreen()));
          }),

          _drawerItem(Icons.category, "All Categories", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AllCategoriesScreen()));
          }),

          _drawerItem(Icons.favorite, "Saved Videos", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const MyLibraryScreen()));
          }),

          _drawerItem(Icons.history, "Watch History", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const MyLibraryScreen()));
          }),

          _drawerItem(Icons.settings, "Settings", () {}),

          _drawerItem(Icons.help_outline, "Help & Support", () {}),

          const Spacer(),

          _drawerItem(Icons.logout, "Logout", () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const SignInScreen()));
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white24,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: Colors.white70, size: 22),
              const SizedBox(width: 20),
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final bool viewAll;

  const SectionTitle({super.key, required this.title, this.viewAll = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      viewAll ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        if (viewAll)
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AllCategoriesScreen()));
            },
            child: const Text("View All →",
                style: TextStyle(color: Colors.orange, fontSize: 14)),
          ),
      ],
    );
  }
}

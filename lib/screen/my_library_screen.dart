import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home_screen.dart';
import 'plus_screen.dart';
import 'trending_section.dart';
import 'video_detail_screen.dart';
import 'search_screen.dart';
import 'all_categories_screen.dart';
import 'sign_in_screen.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else if (index == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const PlusScreen()));
    } else if (index == 2) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TrendingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final historyVideos = [
      {'image': 'assets/license.png', 'locked': true},
      {'image': 'assets/sarkari1.png', 'locked': false},
      {'image': 'assets/sarkari2.png', 'locked': false},
      {'image': 'assets/sarkari3.png', 'locked': false},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),

      drawer: _buildDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.orange.withOpacity(0.25),
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.menu, color: Colors.white),
              ),
            ),
          ),
        ),
        title: const Text(
          "My Library",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            _buildSectionTitle("History"),
            const SizedBox(height: 12),

            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: historyVideos.length,
                itemBuilder: (context, index) {
                  return _buildHistoryCard(
                    context,
                    historyVideos[index]['image'] as String,
                    historyVideos[index]['locked'] as bool,
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
            _buildSectionTitle("Saved"),
            const SizedBox(height: 20),
            _buildEmptyState(
              icon: Icons.archive_outlined,
              message: "Your saved videos will appear here",
            ),

            const SizedBox(height: 30),
            _buildSectionTitle("Liked"),
            const SizedBox(height: 20),
            _buildEmptyState(
              icon: Icons.archive_outlined,
              message: "Your liked videos will appear here",
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
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF1C1C1E),
      child: Column(
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
                  child: const Icon(Icons.person, color: Colors.white, size: 40),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Seekho User",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("user@gmail.com",
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                )
              ],
            ),
          ),

          _drawerItem(Icons.home, "Home", () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          }),

          _drawerItem(Icons.search, "Search", () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen()));
          }),

          _drawerItem(Icons.category, "All Categories", () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AllCategoriesScreen()));
          }),

          _drawerItem(Icons.favorite, "Saved Videos", () {}),

          _drawerItem(Icons.history, "Watch History", () {}),

          _drawerItem(Icons.settings, "Settings", () {}),

          _drawerItem(Icons.help_outline, "Help & Support", () {}),

          const Spacer(),

          _drawerItem(Icons.logout, "Logout", () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInScreen()));
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
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEmptyState({required IconData icon, required String message}) {
    return Column(
      children: [
        Icon(icon, color: Colors.white24, size: 80),
        const SizedBox(height: 16),
        Text(
          message,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildHistoryCard(BuildContext context, String imagePath, bool locked) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Material(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.orange.withOpacity(0.25),
          onTap: () {
            if (locked) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PlusScreen()));
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoDetailScreen(
                  videoTitle: "History Video",
                  videoDate: "12-04-2025",
                  videoDuration: "10:34 Mins",
                  videoDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  mainVideoThumbnail: imagePath,
                  relatedVideos: [],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: 110,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                if (locked)
                  Container(
                    width: 110,
                    height: 160,
                    color: Colors.black.withOpacity(0.55),
                    child: const Center(
                      child: Icon(Icons.lock, color: Colors.white, size: 40),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

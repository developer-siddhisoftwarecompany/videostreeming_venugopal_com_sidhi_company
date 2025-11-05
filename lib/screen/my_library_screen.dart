import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';
import 'plus_screen.dart';
import 'trending_section.dart';
import 'video_detail_screen.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PlusScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TrendingScreen()),
        );
        break;
      case 3:
        break;
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          "My Library",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
        items: <Widget>[
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmptyState({required IconData icon, required String message}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white24, size: 80),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(
      BuildContext context, String imagePath, bool isLocked) {
    return GestureDetector(
      onTap: () {
        if (isLocked) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlusScreen()),
          );
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailScreen(
              videoTitle: "History Video",
              videoDate: "12-04-2025",
              videoDuration: "10:34 Mins",
              videoDescription:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              mainVideoThumbnail: imagePath,
              relatedVideos: [],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 110,
            height: 160,
            color: Colors.white12,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                        child: Icon(Icons.image_not_supported,
                            color: Colors.white24));
                  },
                ),
                if (isLocked)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 40,
                      ),
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
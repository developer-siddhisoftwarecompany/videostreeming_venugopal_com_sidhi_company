import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import for Cupertino icon
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the nav bar
import 'video_detail_screen.dart';

// Imports for navigation
import 'plus_screen.dart';
import 'my_library_screen.dart';
import 'search_screen.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  // Set default index to 2 for "Trending"
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == 2) {
      // We are already on this screen
      setState(() => _selectedIndex = index);
      return;
    }

    if (index == 0) {
      // "Home" - just pop back.
      Navigator.pop(context);
      return;
    }

    // For Plus (1) and My Library (3)
    Widget page;
    if (index == 1) {
      page = const PlusScreen();
    } else {
      // index == 3
      page = const MyLibraryScreen();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ).then((_) {
      // When returning, reset index back to 2 (Trending)
      setState(() => _selectedIndex = 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final videos = [
      {
        "title": "VIDEO DEKHO KAMAO",
        "thumbnail": "assets/thumb1.png",
      },
      {
        "title": "IPL TEAM KAISY PAISY KAMATI HY",
        "thumbnail": "assets/thumb2.png",
      },
      {
        "title": "ENGLISH USE SEEKHO",
        "thumbnail": "assets/thumb3.png",
      },
      {
        "title": "VIDEO DEKHO KAMAO",
        "thumbnail": "assets/thumb4.png",
      },
      {
        "title": "VIDEO DEKHO KAMAO",
        "thumbnail": "assets/thumb4.png",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          "Trending",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Navigate to search screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoDetailScreen(
                            videoTitle: video["title"]!,
                            videoDate: "12-04-2025",
                            videoDuration: "20:28",
                            videoDescription:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            mainVideoThumbnail: video["thumbnail"]!,
                            relatedVideos: [],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2636),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomLeft: Radius.circular(14)),
                            child: Stack(
                              children: [
                                Image.asset(
                                  video["thumbnail"]!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  // Handle image errors
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.white12,
                                        child: const Icon(Icons.broken_image,
                                            color: Colors.white54),
                                      ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Text(
                                      "20:28",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE54B4B),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "YouTube",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    video["title"]!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A5AE0), Color(0xFFFF4B91)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        "START 7 DAYS TRIAL",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Then \$199/Month",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              // Added padding for the nav bar
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      // Replaced with CurvedNavigationBar
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
}
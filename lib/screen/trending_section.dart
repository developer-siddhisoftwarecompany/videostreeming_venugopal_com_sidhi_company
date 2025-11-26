import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'video_detail_screen.dart';
import 'plus_screen.dart';
import 'my_library_screen.dart';
import 'search_screen.dart';
import 'home_screen.dart';
import 'all_categories_screen.dart';
import 'sign_in_screen.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == 2) {
      setState(() => _selectedIndex = index);
      return;
    }
    if (index == 0) {
      Navigator.pop(context);
      return;
    }
    Widget page = index == 1 ? const PlusScreen() : const MyLibraryScreen();
    Navigator.push(context, MaterialPageRoute(builder: (_) => page)).then((_) {
      setState(() => _selectedIndex = 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final videos = [
      {"title": "VIDEO DEKHO KAMAO", "thumbnail": "assets/thumb1.png"},
      {"title": "IPL TEAM KAISY PAISY KAMATI HY", "thumbnail": "assets/thumb2.png"},
      {"title": "ENGLISH USE SEEKHO", "thumbnail": "assets/thumb3.png"},
      {"title": "VIDEO DEKHO KAMAO", "thumbnail": "assets/thumb4.png"},
      {"title": "VIDEO DEKHO KAMAO", "thumbnail": "assets/thumb4.png"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),

      drawer: _buildAppDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white24,
              borderRadius: BorderRadius.circular(50),
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.menu, color: Colors.white),
              ),
            ),
          ),
        ),
        title: const Text(
          "Trending",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white24,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const SearchScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.search, color: Colors.white),
              ),
            ),
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

                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white30,
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VideoDetailScreen(
                              videoTitle: video["title"]!,
                              videoDate: "12-04-2025",
                              videoDuration: "20:28",
                              videoDescription:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
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
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        "20:28",
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 10),
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
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 10),
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
                                      style:
                                      TextStyle(color: Colors.white54, fontSize: 12),
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
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.white24,
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          }),

          _drawerItem(Icons.search, "Search", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const SearchScreen()));
          }),

          _drawerItem(Icons.category, "All Categories", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AllCategoriesScreen()));
          }),

          _drawerItem(Icons.favorite, "Saved Videos", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const MyLibraryScreen()));
          }),

          _drawerItem(Icons.history, "Watch History", () {}),

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

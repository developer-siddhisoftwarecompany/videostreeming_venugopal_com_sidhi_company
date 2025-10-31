import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sarkari_kam.dart';
import 'plus_screen.dart';
import 'trending_section.dart';
import 'my_library_screen.dart';
import 'video_detail_screen.dart';
import 'search_screen.dart';
import 'all_categories_screen.dart';

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

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlusScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrendingScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyLibraryScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.video_library, 'title': 'Free Videos'},
      {'icon': Icons.account_balance, 'title': 'Sarkari Kaam'},
      {'icon': Icons.video_collection, 'title': 'Youtube'},
      {'icon': Icons.work, 'title': 'Part Time'},
      {'icon': Icons.camera_alt, 'title': 'Instagram'},
      {'icon': Icons.apps, 'title': 'View All'},
    ];

    final topVideos = [
      'assets/video1.png',
      'assets/video2.png',
      'assets/video3.png',
      'assets/video4.png',
    ];

    final sarkariList = [
      'assets/sarkari1.png',
      'assets/sarkari2.png',
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
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
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  ],
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
                final category = categories[index];
                final title = category['title'] as String;

                return GestureDetector(
                  onTap: () {
                    if (title == 'Sarkari Kaam') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SarkariKamScreen(),
                        ),
                      );
                    } else if (title == 'View All') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllCategoriesScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(category['icon'] as IconData, color: Colors.white),
                        const SizedBox(height: 6),
                        Text(
                          title,
                          style: const TextStyle(color: Colors.white70),
                        ),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF18181B),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Plus"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.flame_fill), label: "Trending"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: "My Library"),
        ],
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoDetailScreen(
                    videoTitle: "$titlePrefix ${index + 1}",
                    videoDate: "10-10-2025",
                    videoDuration: "12:30 Mins",
                    videoDescription:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
                color: Colors.white12,
                image: DecorationImage(
                  image: AssetImage(videos[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
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
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        if (viewAll)
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllCategoriesScreen(),
                ),
              );
            },
            child: const Text(
              "View All →",
              style: TextStyle(color: Colors.orange, fontSize: 14),
            ),
          ),
      ],
    );
  }
}
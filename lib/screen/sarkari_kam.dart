import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'plus_screen.dart';
import 'trending_section.dart';
import 'my_library_screen.dart';
import 'video_detail_screen.dart';

class SarkariKamScreen extends StatefulWidget {
  const SarkariKamScreen({super.key});

  @override
  State<SarkariKamScreen> createState() => _SarkariKamScreenState();
}

class _SarkariKamScreenState extends State<SarkariKamScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const PlusScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const TrendingScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MyLibraryScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ["Services", "Schemes", "Legal Gym", "Digital"];
    const selectedCategory = 0;

    final videos = [
      "LICENSE KESY BNWAYE",
      "ONLINE PAN CARD",
      "YOUTUBE CHANNEL BNAO",
      "TATKAL TICKET BOOKING",
      "ONLINE PAN CARD",
      "LICENSE KESY BNWAYE",
      "YOUTUBE CHANNEL BNAO",
      "TATKAL TICKET BOOKING",
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Sarkari Kam",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              splashColor: Colors.white24,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search, color: Colors.white),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: isSelected,
                      selectedColor: Colors.orange,
                      backgroundColor: const Color(0xFF1E1E1E),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (_) {},
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  "Top 10 Videos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.white24,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoDetailScreen(
                            videoTitle: videos[index],
                            videoDate: "12-04-2025",
                            videoDuration: "10:34 Mins",
                            videoDescription:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            mainVideoThumbnail:
                            'assets/thumbnail${index % 4 + 1}.png',
                            relatedVideos: [],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/thumbnail${index % 4 + 1}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              index % 3 == 0
                                  ? Icons.lock
                                  : Icons.play_circle_fill,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            const Text(
              "Only On Seekho",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white24,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoDetailScreen(
                            videoTitle: "License Kesy Banwaye",
                            videoDate: "12-04-2025",
                            videoDuration: "10:34 Mins",
                            videoDescription:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            mainVideoThumbnail: 'assets/license.png',
                            relatedVideos: [],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/license.png',
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text(
                        "License Kesy Banwaye",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text("12-04-2025",
                              style: TextStyle(color: Colors.white70)),
                          SizedBox(height: 2),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 12)),
                        ],
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "YouTube",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: "Plus"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: "Trending"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: "My Library"),
        ],
      ),
    );
  }
}

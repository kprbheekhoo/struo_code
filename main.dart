import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badge System',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'playfair display'),
          bodySmall: TextStyle(fontFamily: 'playfair display'),
          titleLarge: TextStyle(
              fontFamily: 'playfair display', fontWeight: FontWeight.bold),
        ),
      ),
      home: const BadgePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BadgePage extends StatefulWidget {
  const BadgePage({super.key});

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  final ScrollController _earnedScroll = ScrollController();
  final ScrollController _unearnedScroll = ScrollController();

  final List<Map<String, dynamic>> earnedBadges = [
    {"image": "assets/Accountable.png", "title": "Accountable", "progress": 1.0, "desc": "accountble person very acountable!! "},
    {"image": "assets/Accurate.png", "title": "Hardworker", "progress": 1.0, "desc": "very accurate person !!!!"},
     {"image": "assets/Accountable.png", "title": "Accountable", "progress": 1.0, "desc": "accountble person very acountable!! "},
    {"image": "assets/Accurate.png", "title": "Hardworker", "progress": 1.0, "desc": "very accurate person !!!!"},
     {"image": "assets/Accountable.png", "title": "Accountable", "progress": 1.0, "desc": "accountble person very acountable!! "},
    {"image": "assets/Accurate.png", "title": "Hardworker", "progress": 1.0, "desc": "very accurate person !!!!"},
     {"image": "assets/Accountable.png", "title": "Accountable", "progress": 1.0, "desc": "accountble person very acountable!! "},
    {"image": "assets/Accurate.png", "title": "Hardworker", "progress": 1.0, "desc": "very accurate person !!!!"},
     {"image": "assets/Accountable.png", "title": "Accountable", "progress": 1.0, "desc": "accountble person very acountable!! "},
    {"image": "assets/Accurate.png", "title": "Hardworker", "progress": 1.0, "desc": "very accurate person !!!!"},
     {"image": "assets/Accountable.png", "title": "Accountable", "progress": 1.0, "desc": "accountble person very acountable!! "},
    {"image": "assets/Accurate.png", "title": "Hardworker", "progress": 1.0, "desc": "very accurate person !!!!"},
    
    
  ];

  final List<Map<String, dynamic>> unearnedBadges = [
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    {"image": "assets/badge3.jpg", "title": "Early Bird", "progress": 0.3, "desc": "Login early in the morning"},
    {"image": "assets/badge4.jpg", "title": "Streak Master", "progress": 0.6, "desc": "Maintain 7-day streak"},
    
    
    
  ];

  void _showBadgePopup(Map<String, dynamic> badge) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(badge["image"], height: 220),
              const SizedBox(height: 12),
              Text(badge["title"],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Serif')),
              const SizedBox(height: 8),
              Text(badge["desc"], style: const TextStyle(fontSize: 16, fontFamily: 'Serif')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Close")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadgeBox(Map<String, dynamic> badge,
      {double boxWidth = 180, double boxHeight = 200, double imageHeight = 100}) {
    final size = MediaQuery.of(context).size;
    final bool isPortrait = size.height >= size.width;

    if (size.width <= 480) {
      // Small phones (portrait)
      boxWidth   = boxWidth.clamp(120.0, size.width * 0.60);
      boxHeight  = boxHeight.clamp(150.0, 220.0);
      imageHeight = imageHeight.clamp(70.0, 100.0);
    } else if (size.width <= 800 && !isPortrait) {
      // Small phones (landscape)
      boxWidth   = boxWidth.clamp(120.0, size.width * 0.40);
      boxHeight  = boxHeight.clamp(140.0, 200.0);
      imageHeight = imageHeight.clamp(60.0, 90.0);
    }
    // For tablets/web/large screens, your original sizes remain.
    // --------------------------------------------------------------------

    bool isEarned = badge["progress"] == 1.0;
    return GestureDetector(
      onTap: () => _showBadgePopup(badge),
      child: Container(
        width: boxWidth,
        height: boxHeight,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: isEarned
                  ? Image.asset(badge["image"], height: imageHeight, fit: BoxFit.contain)
                  : Stack(
                      children: [
                        Image.asset(badge["image"], height: imageHeight, fit: BoxFit.contain),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(color: Colors.black.withOpacity(0)),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 8),
            Text(badge["title"], textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontFamily: 'Serif')),
            const SizedBox(height: 6),
            if (!isEarned) ...[
              Align(
                alignment: Alignment.centerLeft,
               child: Text(
               "complete status",
                style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Serif',
                  ),
                 ),
                ),
              LinearProgressIndicator(
                value: badge["progress"],
                color: Colors.black,
                backgroundColor: Colors.white,
                minHeight: 8,
              ),
              const SizedBox(height: 4),
              Align(
              alignment: Alignment.centerRight,
                child: Text(
                  "${(badge["progress"] * 25).toInt()} / 25 fragment",
                     style: const TextStyle(
                     fontSize: 12,
                     fontFamily: 'Serif',
                    ),
                    ),
                    ),
            ],
          ],
        ),
      ),
    );
  }

  void _viewAll(String title, List<Map<String, dynamic>> badges) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(title)),
          body: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 0.7,
            ),
            itemCount: badges.length,
            itemBuilder: (context, index) {
              return _buildBadgeBox(badges[index], boxWidth: 120, boxHeight: 160, imageHeight: 80);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildearned(
    String title,
    String description,
    List<Map<String, dynamic>> badges,
    ScrollController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header (title + subtitle + View All button)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row (title centered, View All right side)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Serif')),
                TextButton(
                  onPressed: () => _viewAll(title, badges),
                  child: const Text("View All"),
                ),
              ],
            ),
            // Custom description text (under the title)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(
                description, // <- you can pass any custom text
                style: const TextStyle(
                    fontSize: 14, fontFamily: 'Serif'),
              ),
            ),
          ],
        ),
      ),

      // Badge row with scroll arrows
      SizedBox(
        height: 230,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                controller.animateTo(controller.offset - 200,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children:
                      badges.map((badge) => _buildBadgeBox(badge)).toList(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                controller.animateTo(controller.offset + 200,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    ],
  );
}
Widget _buildNotEarnedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text("Badges in progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Serif')),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12, bottom: 8),
          child: Text("Get fragments from job board training . ", style: TextStyle(fontSize: 14, fontFamily: 'Serif')),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // two per row
            childAspectRatio: 0.7,
          ),
          itemCount: unearnedBadges.length,
          itemBuilder: (context, index) {
            return _buildBadgeBox(unearnedBadges[index],
                boxWidth: 200, boxHeight: 230, imageHeight: 80);
          },
        ),
      ],
    );
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true, // ← this centers the title
      title: const Text("Achievements"),
      leading: IconButton( // ← puts the button on the LEFT
        icon: const Icon(Icons.menu), 
        onPressed: () {
          // TODO: add function later
        },
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildearned(
            "Badges Earned",
            "Badges below will be show to employees!",
            earnedBadges,
            _earnedScroll,
          ),
          _buildNotEarnedSection(),
        ],
      ),
    ),
  );
}

}
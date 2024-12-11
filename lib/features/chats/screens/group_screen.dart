import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/features/chats/screens/widgets/post_card.dart';
import 'package:scapio/features/chats/screens/widgets/post_view.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final List<Map<String, dynamic>> stories = [
    {'emoji': '🔬', 'name': 'Science', 'color': Colors.purple},
    {'emoji': '➗', 'name': 'Math', 'color': Colors.orange},
    {'emoji': '💻', 'name': 'Computers', 'color': Colors.blue},
    {'emoji': '📜', 'name': 'History', 'color': Colors.green},
    {'emoji': '⚛️', 'name': 'Physics', 'color': Colors.red},
    {'emoji': '🌐', 'name': 'Web Dev', 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(LucideIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.settings2)),
        ],
        surfaceTintColor: Colors.white,
        title: const Text(
          'SAPIO',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 24,
              letterSpacing: 2),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Stories Row
          Container(
            height: MediaQuery.of(context).size.height * 0.127,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return _buildStoryItem(
                  stories[index]['emoji']!,
                  stories[index]['name']!,
                  stories[index]['color']!,
                );
              },
            ),
          ),
          // Main Post View
          Expanded(child: PostView()),
        ],
      ),
    );
  }

  // Build each story item
  Widget _buildStoryItem(String emoji, String storyName, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // Story emoji in a squircle container
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2), // Light background color
              borderRadius: BorderRadius.circular(16), // Squircle shape
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 28), // Adjust emoji size
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Dynamic name for each story
          SizedBox(
            width: 70, // Constrain text width to match the container width
            child: Text(
              storyName,
              style: const TextStyle(fontSize: 12, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/features/chats/screens/chat_screen.dart';
import 'package:scapio/home/widgets/card_view.dart';
import 'package:scapio/home/widgets/profile_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    CardView(),
    Center(child: Text('For You Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('People Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Liked You Page', style: TextStyle(fontSize: 24))),
    ChatHomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          // Removes default padding
          children: [
            // Drawer Header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountEmail: Text(
                'pranavajay2002@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
              accountName: Text(
                'Pranav Ajay',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: SvgPicture.asset(
                    'assets/pfp.svg', // Replace with your SVG file path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Profile Option
            ListTile(
              leading: const Icon(LucideIcons.user2),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile screen
              },
            ),
            // Edit Profile Option
            ListTile(
              leading: const Icon(LucideIcons.edit3),
              title: const Text('Edit Profile'),
              onTap: () {
                // Navigate to Edit Profile screen
              },
            ),
            // Notifications Option
            ListTile(
              leading: const Icon(LucideIcons.bellDot),
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to Notifications screen
              },
            ),
            // Personalities Option
            ListTile(
              leading: const Icon(LucideIcons.brain),
              title: const Text('Personalities'),
              onTap: () {
                // Navigate to Personalities screen
              },
            ),
            // Settings Option
            ListTile(
              leading: const Icon(LucideIcons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen
              },
            ),
            // Interests Option
            ListTile(
              leading: const Icon(LucideIcons.atom),
              title: const Text('Interests'),
              onTap: () {
                // Navigate to Interests screen
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'SAPIO',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 24,
              letterSpacing: 2),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.undo2, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.settings2, color: Colors.black),
          ),
        ],
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.grey.withOpacity(0.3),
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(LucideIcons.galleryHorizontalEnd),
            label: 'Match',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.star),
            label: 'For You',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.users),
            label: 'People',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.heart),
            label: 'Liked You',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.messageCircle),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;

  const ChatScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(chat.profileImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  '${chat.name} is currently focused on work', // Example status text
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🎯',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 46),
                  ),
                  Text(
                    '${chat.name} is currently focused on work',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Text(
                      'We respect a Bizzy Bee and think hard work\n'
                      'deserves a round of applause. Don’t hate the hustle 👏',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Text(
                    '👋',
                    style: TextStyle(fontSize: 22),
                  ),
                  label: const Text('Send a GIF'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 73, 47, 47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  icon: const Icon(LucideIcons.gamepad2, size: 20),
                  label: const Text('Question Game'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(LucideIcons.camera, color: Colors.black),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Data for Chats
class Chat {
  final String name;
  final String profileImage;
  final String lastMessage;
  final String time;
  final int unreadCount;

  Chat({
    required this.name,
    required this.profileImage,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });
}

final List<Chat> chatList = [
  Chat(
    name: 'John Doe',
    profileImage: 'assets/us1.jpg', // Replace with actual image path
    lastMessage: 'Hey, how are you?',
    time: '10:45 AM',
    unreadCount: 2,
  ),
  Chat(
    name: 'Jane Smith',
    profileImage: 'assets/us2.jpg',
    lastMessage: 'Are we still on for the meeting?',
    time: '9:30 AM',
    unreadCount: 4,
  ),
  Chat(
    name: 'Ashley',
    profileImage: 'assets/us3.jpg',
    lastMessage: 'Did you see the new experiment?',
    time: 'Yesterday',
    unreadCount: 0,
  ),
  Chat(
    name: 'Roy',
    profileImage: 'assets/us4.jpg',
    lastMessage: 'What is the meaning of life?',
    time: 'Monday',
    unreadCount: 3,
  ),
];

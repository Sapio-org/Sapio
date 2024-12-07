import 'package:flutter/material.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontally scrollable group avatars
        SizedBox(
          height: 100, // Adjust height for avatars
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: groupNames.length,
            itemBuilder: (context, index) {
              return _buildGroupAvatar(groupNames[index]);
            },
          ),
        ),
        const Divider(), // Divider between avatars and chats
        // Chat list
        Expanded(
          child: ListView.builder(
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              return _buildChatItem(chatList[index]);
            },
          ),
        ),
      ],
    );
  }

  // Builds each group avatar
  Widget _buildGroupAvatar(String groupName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: const Icon(
              Icons.group,
              size: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            groupName,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Builds each chat item
  Widget _buildChatItem(Chat chat) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(chat.profileImage),
      ),
      title: Text(
        chat.name,
      ),
      subtitle:
          Text(chat.lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          if (chat.unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${chat.unreadCount}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () {
        // Navigate to chat screen
      },
    );
  }
}

// Dummy Data for Groups and Chats
const List<String> groupNames = [
  'Science Geeks',
  'Philosophy Club',
  'Math Wizards',
  'AI Enthusiasts',
  'Techies Unite',
];

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

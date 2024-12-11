import 'package:flutter/material.dart';
import 'package:scapio/features/chats/screens/chat_screen.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title "Chat"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'CHATS',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                  letterSpacing: 2),
            ),
          ),

          // Chat list
          Expanded(
            child: ListView.separated(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return _buildChatItem(context, chatList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(
                    thickness: 0.5, // Adjust thickness if needed
                    height: 0.5, // Adjust spacing between items
                    color: Colors.grey, // Adjust color if needed
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Builds each chat item
  Widget _buildChatItem(BuildContext context, Chat chat) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(chat.profileImage),
      ),
      title: Text(
        chat.name,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        chat.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(chat: chat),
          ),
        );
      },
    );
  }
}

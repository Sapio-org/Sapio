import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/features/chats/models/post_model.dart';
import 'package:scapio/home/data/dummy_cards.dart';
import 'package:scapio/home/models/profile_card_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.onAuthorTap,
  });

  final Post post;
  final void Function(ProfileCardModel) onAuthorTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            // Scrollable Content (Post and Replies)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 8, bottom: 8),
                children: [
                  // Author and Time
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    // tileColor: Colors.red,
                    onTap: () => onAuthorTap(dummyProfiles[0]),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/us1.jpg'),
                    ),
                    title: Text(
                      post.author,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      post.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Bookmark action
                      },
                      icon: const Icon(LucideIcons.bookmark),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Title
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Content
                  Text(
                    post.content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Images
                  if (post.images != null && post.images.isNotEmpty)
                    Row(
                      children: post.images
                          .map<Widget>((image) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    image,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  const SizedBox(height: 16),
                  // Tags
                  Wrap(
                    spacing: 8,
                    children: post.tags
                        .map<Widget>((tag) => Chip(
                              side: BorderSide.none,
                              label: Text(tag),
                              backgroundColor: const Color(0xffF2F6FA),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  // Replies Section
                  if (post.replies.isNotEmpty) ...[
                    const Divider(),
                    Text(
                      'Replies (${post.replies.length})',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Render Replies
                    Column(
                      children: post.replies.map<Widget>((reply) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/us2.jpg'),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          reply.author,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          reply.time,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      reply.content,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          LucideIcons.heart,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${reply.likes}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
            // Reply Input Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ReplyInput(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReplyInput extends StatelessWidget {
  const ReplyInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xffF2F6FA),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Icon(
                  LucideIcons.smilePlus,
                  color: Colors.grey,
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write a reply...",
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 40, // Width of the circle
          height: 40, // Height of the circle
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent.withOpacity(0.1), // Background color
          ),
          child: IconButton(
            onPressed: () {
              // Add reply action
            },
            icon: const Icon(
              LucideIcons.send,
              size: 18,
              color: Colors.blueAccent,
            ),
            padding: const EdgeInsets.all(8),
            splashRadius: 24,
          ),
        )
      ],
    );
  }
}

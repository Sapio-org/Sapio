import 'package:scapio/features/chats/models/post_reply_model.dart';

class Post {
  final String author;
  final String time;
  final String title;
  final String content;
  final List<String> tags;
  final List<String> images;
  final List<Reply> replies;

  Post({
    required this.author,
    required this.time,
    required this.title,
    required this.content,
    required this.tags,
    required this.images,
    required this.replies,
  });

  // Factory method to create a Post from a Map
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      author: map['author'],
      time: map['time'],
      title: map['title'],
      content: map['content'],
      tags: List<String>.from(map['tags']),
      images: List<String>.from(map['images']),
      replies: List<Reply>.from(
        map['replies']?.map((reply) => Reply.fromMap(reply)) ?? [],
      ),
    );
  }

  // Convert a Post to a Map
  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'time': time,
      'title': title,
      'content': content,
      'tags': tags,
      'images': images,
      'replies': replies.map((reply) => reply.toMap()).toList(),
    };
  }
}

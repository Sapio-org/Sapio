class Reply {
  final String author;
  final String content;
  final int likes;
  final String time;

  Reply({
    required this.author,
    required this.content,
    required this.likes,
    required this.time,
  });

  // Factory method to create a Reply from a Map
  factory Reply.fromMap(Map<String, dynamic> map) {
    return Reply(
      author: map['author'],
      content: map['content'],
      likes: map['likes'],
      time: map['time'],
    );
  }

  // Convert a Reply to a Map
  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'content': content,
      'likes': likes,
      'time': time,
    };
  }
}

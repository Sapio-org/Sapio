import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  final String groupName;

  const GroupScreen({Key? key, required this.groupName}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'author': 'Pranav Ajay',
      'time': '1h ago',
      'title': 'C# In A Nutshell',
      'content': 'So, I’ve been using C# for a whole decade now. '
          'If you guys know how to break the boring feeling, please let me know! '
          'PS: here’s some memes of the day xoxo.',
      'tags': ['C#', 'Programming', 'Memes'],
      'images': [
        'https://via.placeholder.com/100',
        'https://via.placeholder.com/100'
      ],
      'replies': [
        {
          'author': 'Miriam de Jesús',
          'content':
              'LMAO try to learn PHP. It’s basically for noobs but great if you wanna have fun!',
          'likes': 120,
          'time': '1h ago',
        },
        {
          'author': 'Georges Embolo',
          'content': 'Well, I think...',
          'likes': 50,
          'time': '1h ago',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FA),
      appBar: AppBar(
        title: Text(widget.groupName),
        backgroundColor: Color(0xffF2F6FA),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Author and Time
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['author'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            post['time'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Title
                  Text(
                    post['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Content
                  Text(
                    post['content'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Images
                  if (post['images'] != null && post['images'].isNotEmpty)
                    Row(
                      children: post['images']
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
                    children: post['tags']
                        .map<Widget>((tag) => Chip(
                              side: BorderSide.none,
                              label: Text(tag),
                              backgroundColor: Color(0xffF2F6FA),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

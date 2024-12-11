import 'package:scapio/features/chats/models/post_model.dart';

final List<Post> dummyPosts = [
  Post.fromMap({
    'author': 'Pranav Ajay',
    'time': '1h ago',
    'title': 'C# In A Nutshell',
    'content': 'So, I’ve been using C# for a whole decade now. '
        'If you guys know how to break the boring feeling, please let me know! '
        'PS: here’s some memes of the day xoxo.',
    'tags': ['C#', 'Programming', 'Memes'],
    'images': [
      'https://via.placeholder.com/100',
      'https://via.placeholder.com/100',
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
  }),
  Post.fromMap({
    'author': 'Sophia Patel',
    'time': '2h ago',
    'title': 'Best Practices for Flutter State Management',
    'content': 'I’m a bit confused about state management in Flutter. '
        'What’s the best approach? Provider? Riverpod? Bloc?',
    'tags': ['Flutter', 'State Management', 'Help'],
    'images': [],
    'replies': [
      {
        'author': 'Alex Johnson',
        'content':
            'Provider is great for beginners. If you’re planning for scalability, check out Riverpod.',
        'likes': 75,
        'time': '1h ago',
      },
      {
        'author': 'Liam Smith',
        'content':
            'Bloc is powerful but comes with a steep learning curve. Start with Provider!',
        'likes': 62,
        'time': '30m ago',
      },
    ],
  }),
  Post.fromMap({
    'author': 'Michael Yu',
    'time': '3h ago',
    'title': 'What Are the Best VS Code Extensions?',
    'content':
        'Hey, everyone! I’m looking for recommendations for VS Code extensions to improve productivity.',
    'tags': ['VS Code', 'Extensions', 'Productivity'],
    'images': [
      'https://via.placeholder.com/100',
    ],
    'replies': [
      {
        'author': 'Emily Wang',
        'content':
            'Try Prettier, ESLint, and GitLens. They’ve been lifesavers for me!',
        'likes': 90,
        'time': '2h ago',
      },
      {
        'author': 'Daniel Roberts',
        'content':
            'I’d also suggest Code Spell Checker and Bracket Pair Colorizer.',
        'likes': 45,
        'time': '1h ago',
      },
    ],
  }),
  Post.fromMap({
    'author': 'Lara Vega',
    'time': '5h ago',
    'title': 'React vs Angular: Which One to Learn in 2024?',
    'content':
        'I’m trying to decide whether to learn React or Angular next year. '
            'Which one has better career prospects?',
    'tags': ['React', 'Angular', 'Career'],
    'images': [],
    'replies': [
      {
        'author': 'Chris Thompson',
        'content':
            'React is more popular and has a larger job market. Go for it!',
        'likes': 140,
        'time': '4h ago',
      },
      {
        'author': 'Julia Grant',
        'content':
            'Angular is great for enterprise-level apps. React is easier to pick up for beginners.',
        'likes': 80,
        'time': '3h ago',
      },
    ],
  }),
  Post.fromMap({
    'author': 'Nina Brown',
    'time': '8h ago',
    'title': 'AI Tools for Content Writing',
    'content':
        'I’ve been experimenting with AI tools like ChatGPT and Jasper for writing. '
            'Any recommendations for better tools?',
    'tags': ['AI', 'Content Writing', 'Tools'],
    'images': [
      'https://via.placeholder.com/100',
      'https://via.placeholder.com/100',
    ],
    'replies': [
      {
        'author': 'Oliver Green',
        'content':
            'Grammarly and Jasper are amazing for editing and generating ideas.',
        'likes': 100,
        'time': '6h ago',
      },
      {
        'author': 'Sophia Lee',
        'content': 'Check out Writesonic. It’s great for content creators!',
        'likes': 60,
        'time': '5h ago',
      },
    ],
  }),
];

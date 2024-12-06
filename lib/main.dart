import 'package:flutter/material.dart';
import 'package:scapio/home/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Image.asset(
                  'assets/landing.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Find your first ',
                        style: const TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sapio',
                            style: const TextStyle(
                              color: Color(0xFF684DE8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: ' match.',
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Join us and socialize with fellow Sapiens',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    // const Spacer(),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            icon: const Icon(Icons.arrow_forward, size: 18),
                            label: const Text(
                              'Get started',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    24), // Squircle effect
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Apple Login Button
                        _buildSquircleIconButton(
                          onPressed: () {},
                          icon: Icons.apple,
                          backgroundColor: Colors.black.withOpacity(0.1),
                        ),
                        const SizedBox(width: 16),
                        _buildSquircleIconButton(
                          onPressed: () {},
                          icon: Icons.g_mobiledata,
                          backgroundColor: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(
                              color: Color(0xFF684DE8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarCircle(
      double top, double left, double size, Color color, IconData icon) {
    return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: size,
        backgroundColor: color.withOpacity(0.2),
        child: CircleAvatar(
          radius: size - 5,
          backgroundColor: color,
          child: Icon(
            icon,
            size: size * 0.75,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {},
      ),
    );
  }
}

Widget _buildSquircleIconButton({
  required VoidCallback onPressed,
  required IconData icon,
  required Color backgroundColor,
}) {
  return Container(
    width: 56,
    height: 56,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24), // Squircle effect
    ),
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: Colors.black,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:scapio/home/models/profile_card_model.dart'; // Import the model
import 'package:scapio/home/widgets/buildinterestchip.dart';
import 'package:scapio/home/widgets/interest_grid.dart'; // For the interest chip widget

class ProfileCard extends StatelessWidget {
  final ProfileCardModel profile; // Accept the ProfileCardModel

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                profile.avatarIcon, // Use the avatarIcon from the model
                fit: BoxFit.cover,
              ),
            ),
            // Gradient overlay for better readability of text
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            // Content on top of the image
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and age
                  Text(
                    '${profile.name}, ${profile.age}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // New Here Tag
                  if (profile.newHere)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.yellow[100]?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'New here',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  // Headline
                  Text(
                    profile.headline,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Interests
                  InterestGrid(interests: profile.interests)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

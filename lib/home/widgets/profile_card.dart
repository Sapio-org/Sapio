import 'package:flutter/material.dart';
import 'package:scapio/home/models/profile_card_model.dart'; // Import the model
import 'package:scapio/home/widgets/buildinterestchip.dart'; // For the interest chip widget

class ProfileCard extends StatelessWidget {
  final ProfileCardModel profile; // Accept the ProfileCardModel

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        child: ListView(
          children: [
            // Profile Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                profile.avatarIcon, // Use the avatarIcon from the model
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.42,
              ),
            ),
            // Profile Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name and Age
                          Text(
                            '${profile.name}, ${profile.age}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // New Here Tag
                          if (profile.newHere)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.yellow[100],
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
                        ],
                      ),
                      // Star Button
                      IconButton(
                        onPressed: () {
                          // Add functionality for star button if needed
                        },
                        icon: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Headline
                  Text(
                    profile.headline,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Interests
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: profile.interests
                        .map((interest) => buildInterestChip(interest.name))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

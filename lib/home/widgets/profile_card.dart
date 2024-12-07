import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/home/models/profile_card_model.dart';
import 'package:scapio/home/widgets/interest_grid.dart';

class ProfileCard extends StatelessWidget {
  final ProfileCardModel profile;

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
            child: ListView(children: [
              // Top section: Background Image with overlay
              Stack(
                children: [
                  Image.asset(
                    profile.avatarIcon,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
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
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (profile.newHere)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.yellow[100]?.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Text(
                              'New here',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        Text(
                          '${profile.name}, ${profile.age}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.briefcase,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              profile.headline,
                              style: const TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InterestGrid(interests: profile.interests)
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Location

              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bio',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(profile.bio),

                    const SizedBox(height: 16),

                    // Interests

                    const SizedBox(height: 16),

                    // Skills
                    Text(
                      'Skills',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: profile.skills
                          .map((skill) => Chip(
                                label: Text(skill),
                                backgroundColor: Colors.blue.withOpacity(0.2),
                              ))
                          .toList(),
                    ),

                    const SizedBox(height: 16),

                    // GitHub and LinkedIn (Optional)
                    if (profile.gitProfile != null ||
                        profile.linkedInProfile != null)
                      Text(
                        'Profiles',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    if (profile.gitProfile != null)
                      ListTile(
                        leading:
                            const Icon(LucideIcons.github, color: Colors.black),
                        title: Text('GitHub: ${profile.gitProfile}'),
                        onTap: () {
                          // Open GitHub URL
                        },
                      ),
                    if (profile.linkedInProfile != null)
                      ListTile(
                        leading: const Icon(LucideIcons.linkedin,
                            color: Colors.blue),
                        title: Text('LinkedIn: ${profile.linkedInProfile}'),
                        onTap: () {
                          // Open LinkedIn URL
                        },
                      ),

                    const SizedBox(height: 16),

                    // Favorite Projects (Optional)
                    if (profile.favoriteProjects != null &&
                        profile.favoriteProjects!.isNotEmpty)
                      Text(
                        'Favorite Projects',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    if (profile.favoriteProjects != null &&
                        profile.favoriteProjects!.isNotEmpty)
                      Column(
                        children: profile.favoriteProjects!
                            .map((project) => ListTile(
                                  leading: const Icon(LucideIcons.workflow,
                                      color: Colors.amber),
                                  title: Text(project),
                                ))
                            .toList(),
                      ),

                    const SizedBox(height: 16),

                    // Prompts and Answers
                    Text(
                      'Prompts & Answers',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    if (profile.promptsAndAnswers != null)
                      Column(
                        children: profile.promptsAndAnswers!
                            .map((qa) => Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Q: ${qa['prompt']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text('A: ${qa['answer']}'),
                                    ],
                                  ),
                                ))
                            .toList(),

                        // Bio
                      ),
                  ],
                ),
              )
            ])));
  }
}

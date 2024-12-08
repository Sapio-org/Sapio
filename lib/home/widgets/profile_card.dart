import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/home/models/profile_card_model.dart';
import 'package:scapio/home/widgets/build_profile_grid.dart';
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
        // elevation: 5,
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

              const SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My bio',
                      style: const TextStyle(
                          color: Color(0xff5E5C5D),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profile.bio,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),

                    const SizedBox(height: 32),

                    // Interests

                    Text(
                      'About Me',
                      style: const TextStyle(
                          color: Color(0xff5E5C5D),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 5.0, // Space between chips
                      runSpacing: 0.0, // Space between rows
                      children: profile.aboutme.map((item) {
                        return Chip(
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                16), // Small border radius
                          ),
                          padding: EdgeInsets.all(2),
                          avatar: item.icon != null
                              ? Icon(item.icon, size: 16)
                              : null,
                          label: Text(item.name),
                          backgroundColor: Color(0xffF2F2F2),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    // Skills
                    Text(
                      'Skills',
                      style: const TextStyle(
                          color: Color(0xff5E5C5D),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Wrap(
                        spacing: 8,
                        children: profile.skills
                            .map((skill) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  margin: EdgeInsets.all(4),
                                  child: Text(skill),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ))
                            .toList(),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // GitHub and LinkedIn (Optional)
                    if (profile.gitProfile != null ||
                        profile.linkedInProfile != null)
                      Text(
                        'Profiles',
                        style: const TextStyle(
                            color: Color(0xff5E5C5D),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    buildProfileLinks(profile),

                    const SizedBox(height: 32),
// Prompts and Answers interleaved with Favorite Projects
                    if (profile.promptsAndAnswers != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: profile.promptsAndAnswers!
                            .asMap()
                            .entries
                            .map((entry) {
                          final index = entry.key;
                          final qa = entry.value;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Prompt and Answer
                              Padding(
                                padding: const EdgeInsets.only(bottom: 32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${qa['prompt']}',
                                      style: const TextStyle(
                                          color: Color(0xff5E5C5D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${qa['answer']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),

                              // Favorite Projects (between the QA pairs)
                              if (index == 0 &&
                                  profile.favoriteProjects != null &&
                                  profile.favoriteProjects!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Favorite Projects',
                                      style: TextStyle(
                                          color: Color(0xff5E5C5D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: profile.favoriteProjects!
                                          .map(
                                            (project) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // Add your logic here
                                                    },
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        color: Colors.green
                                                            .withOpacity(0.1),
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          LucideIcons.album,
                                                          size: 30,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          project.name,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Text(
                                                          project.descr,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                            ],
                          );
                        }).toList(),
                      ),

                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      padding: EdgeInsets.all(6),
                      child: Text(
                        '🇮🇳 Lives in ${profile.location}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}

import 'package:scapio/home/models/about_me_model.dart';
import 'package:scapio/home/models/interest_model.dart';
import 'package:scapio/home/models/project_model.dart';

class ProfileCardModel {
  final String name;
  final int age;
  final bool newHere;
  final String headline;
  final List<Interest> interests;
  final String location;
  final String bio;
  final List<String> skills;
  final bool openForCollaboration;
  final String avatarIcon;
  final List<AboutMeChipModel> aboutme; // Bumble-style "About Me" field

  // Optional fields
  final String? gitProfile; // GitHub profile URL
  final String? linkedInProfile; // LinkedIn profile URL
  final List<Project>? favoriteProjects; // List of favorite projects
  final List<Map<String, String>>? promptsAndAnswers; // Prompts & answers

  ProfileCardModel({
    required this.name,
    required this.age,
    required this.newHere,
    required this.headline,
    required this.interests,
    required this.location,
    required this.bio,
    required this.skills,
    required this.openForCollaboration,
    required this.avatarIcon,
    required this.aboutme, // "About Me" is now required
    this.gitProfile,
    this.linkedInProfile,
    this.favoriteProjects,
    required this.promptsAndAnswers,
  });
}

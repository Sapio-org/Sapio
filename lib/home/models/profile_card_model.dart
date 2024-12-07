import 'package:scapio/home/models/interest_model.dart';

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

  // Optional fields
  final String? gitProfile; // GitHub profile URL
  final String? linkedInProfile; // LinkedIn profile URL
  final List<String>? favoriteProjects; // List of favorite projects
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
    this.gitProfile,
    this.linkedInProfile,
    this.favoriteProjects,
    required this.promptsAndAnswers,
  });
}

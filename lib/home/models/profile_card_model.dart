import 'package:scapio/home/models/interest_model.dart';

class ProfileCardModel {
  final String name;
  final int age;
  final bool newHere; // Changed naming to follow camelCase
  final String headline; // A brief "nerdy" description
  final List<Interest> interests; // User's nerdy interests
  final String location; // Location of the user
  final String bio; // A short bio for more context
  final List<String> skills; // List of key skills
  final bool openForCollaboration; // Whether they're open to collaborate
  final String avatarIcon; // Icon representing the user's persona (optional)

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
  });
}

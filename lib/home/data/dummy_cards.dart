import 'package:flutter/material.dart';
import 'package:scapio/home/models/interest_model.dart';
import 'package:scapio/home/models/profile_card_model.dart';

final List<ProfileCardModel> dummyProfiles = [
  ProfileCardModel(
    name: "Ada Lovelace",
    age: 29,
    newHere: true,
    headline: "Pioneer of Algorithms",
    interests: [
      Interest(name: "Math", icon: Icons.calculate),
      Interest(name: "AI", icon: Icons.psychology),
      Interest(name: "History of Computers", icon: Icons.computer),
    ],
    location: "London, UK",
    bio:
        "I’m a mathematician with a passion for algorithms and computing history.",
    skills: ["Algorithm Design", "Mathematics", "Writing"],
    openForCollaboration: true,
    avatarIcon: "assets/us1.jpg",
    gitProfile: "https://github.com/ada-lovelace",
    linkedInProfile: "https://linkedin.com/in/adalovelace",
    favoriteProjects: [
      "Analytical Engine Algorithm",
      "Mathematical Manuscripts",
    ],
    promptsAndAnswers: [
      {
        "prompt": "What inspires you?",
        "answer": "The beauty of mathematics and its applications."
      },
      {
        "prompt": "What’s a fun fact about you?",
        "answer": "I wrote the first algorithm for a computer."
      },
    ],
  ),
  ProfileCardModel(
    name: "Nikola Tesla",
    age: 37,
    newHere: false,
    headline: "Electricity Enthusiast",
    interests: [
      Interest(name: "Physics", icon: Icons.lightbulb),
      Interest(name: "Engineering", icon: Icons.settings),
      Interest(name: "Energy Innovation", icon: Icons.bolt),
    ],
    location: "New York, USA",
    bio:
        "I love creating futuristic inventions and exploring the power of electricity.",
    skills: ["Electrical Engineering", "Invention", "Problem Solving"],
    openForCollaboration: false,
    avatarIcon: "assets/us2.jpg",
    gitProfile: null, // Not provided
    linkedInProfile: "https://linkedin.com/in/nikolatesla",
    favoriteProjects: [
      "Tesla Coil",
      "AC Power System",
    ],
    promptsAndAnswers: [
      {
        "prompt": "What motivates you?",
        "answer": "The quest to revolutionize energy systems."
      },
      {
        "prompt": "What’s your dream project?",
        "answer": "A wireless energy transmission system."
      },
    ],
  ),
  ProfileCardModel(
    name: "Marie Curie",
    age: 34,
    newHere: true,
    headline: "Radiation Researcher",
    interests: [
      Interest(name: "Chemistry", icon: Icons.science),
      Interest(name: "Physics", icon: Icons.bolt),
      Interest(name: "Research", icon: Icons.search),
      Interest(name: "Research", icon: Icons.search),
      Interest(name: "Research", icon: Icons.search),
    ],
    location: "Paris, France",
    bio:
        "Passionate about scientific discovery, especially in radiation and chemistry.",
    skills: ["Research", "Chemistry", "Teaching"],
    openForCollaboration: true,
    avatarIcon: "assets/us3.jpg",
    gitProfile: "https://github.com/marie-curie",
    linkedInProfile: null, // Not provided
    favoriteProjects: [
      "Radium Research",
      "Polonium Studies",
    ],
    promptsAndAnswers: [
      {
        "prompt": "Why do you love research?",
        "answer": "It unlocks the mysteries of the universe."
      },
      {
        "prompt": "What’s your biggest accomplishment?",
        "answer": "Winning two Nobel Prizes in different sciences."
      },
    ],
  ),
];

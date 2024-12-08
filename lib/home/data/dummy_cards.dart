import 'package:flutter/material.dart';
import 'package:scapio/home/models/interest_model.dart';
import 'package:scapio/home/models/profile_card_model.dart';
import 'package:scapio/home/models/project_model.dart';
import 'package:scapio/home/models/about_me_model.dart';

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
    aboutme: [
      AboutMeChipModel(name: "🙎‍♀️ Woman"),
      AboutMeChipModel(name: "🛕 Hindu"),
      AboutMeChipModel(name: "💻 Tech Enthusiast"),
      AboutMeChipModel(name: "🧮 Mathematician"),
    ],
    gitProfile: "https://github.com/ada-lovelace",
    linkedInProfile: "https://linkedin.com/in/adalovelace",
    favoriteProjects: [
      Project(
        name: "Analytical Engine Algorithm",
        descr: "The first algorithm designed for Charles Babbage's machine.",
      ),
      Project(
        name: "Mathematical Manuscripts",
        descr:
            "Compilation of mathematical insights and problem-solving techniques.",
      ),
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
    aboutme: [
      AboutMeChipModel(name: "Man"),
      AboutMeChipModel(name: "Inventor"),
      AboutMeChipModel(name: "Innovator"),
      AboutMeChipModel(name: "Serbian-American"),
    ],
    gitProfile: null, // Not provided
    linkedInProfile: "https://linkedin.com/in/nikolatesla",
    favoriteProjects: [
      Project(
        name: "Tesla Coil",
        descr: "A revolutionary device for wireless energy transmission.",
      ),
      Project(
        name: "AC Power System",
        descr: "Development of an efficient alternating current power system.",
      ),
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
    ],
    location: "Paris, France",
    bio:
        "Passionate about scientific discovery, especially in radiation and chemistry.",
    skills: ["Research", "Chemistry", "Teaching"],
    openForCollaboration: true,
    avatarIcon: "assets/us3.jpg",
    aboutme: [
      AboutMeChipModel(name: "Woman"),
      AboutMeChipModel(name: "Scientist"),
      AboutMeChipModel(name: "Mother"),
      AboutMeChipModel(name: "Polish-French"),
    ],
    gitProfile: "https://github.com/marie-curie",
    linkedInProfile: null, // Not provided
    favoriteProjects: [
      Project(
        name: "Radium Research",
        descr: "Investigating the properties and applications of radium.",
      ),
      Project(
        name: "Polonium Studies",
        descr: "Groundbreaking work on the discovery and study of polonium.",
      ),
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

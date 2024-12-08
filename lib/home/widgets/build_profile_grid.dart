import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

Widget buildProfileLinks(profile) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Wrap(
      spacing: 16.0, // Horizontal spacing between icons
      runSpacing: 16.0, // Vertical spacing between rows
      children: [
        if (profile.gitProfile != null)
          _buildIconButton(
            icon: LucideIcons.github,
            color: Colors.black,
            url: profile.gitProfile,
          ),
        if (profile.linkedInProfile != null)
          _buildIconButton(
            icon: LucideIcons.linkedin,
            color: Colors.blue,
            url: profile.linkedInProfile,
          ),
      ],
    ),
  );
}

Widget _buildIconButton(
    {required IconData icon, required Color color, required String url}) {
  return InkWell(
    onTap: () {
      // Open the respective URL
      _openUrl(url);
    },
    child: Container(
      width: 50, // Smaller width for the icon
      height: 50, // Smaller height for the icon
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
        color: color.withOpacity(0.1),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20, // Smaller icon size
          color: color,
        ),
      ),
    ),
  );
}

void _openUrl(String url) {
  // You would typically use url_launcher to open the URL
  // For example:
  // launch(url);
  print('Opening URL: $url'); // Replace with actual URL launch code
}

import 'package:flutter/material.dart';
import 'package:scapio/home/models/interest_model.dart';

class InterestGrid extends StatelessWidget {
  final List<Interest> interests;

  const InterestGrid({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    // Limit to show three interests, with an ellipsis if there are more
    final visibleInterests = interests.take(3).toList();
    final hasMoreInterests = interests.length > 3;

    return Wrap(
      spacing: 8, // Space between chips
      runSpacing: 0, // Space between rows of chips if overflowed
      alignment: WrapAlignment.start,
      children: [
        // Display the first three interests as chips
        ...visibleInterests.map(
          (interest) => Chip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  interest.icon,
                  size: 14,
                  color: Colors.black54,
                ),
                const SizedBox(width: 4),
                Text(
                  interest.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            backgroundColor: interests.indexOf(interest) == 0
                ? null // This will apply the gradient if it’s the first chip
                : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: interests.indexOf(interest) == 0
                  ? BorderSide.none
                  : BorderSide(color: Colors.grey[300]!),
            ),
            elevation: interests.indexOf(interest) == 0 ? 2 : 0,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        ),
        // Ellipsis if there are more than three interests
        if (hasMoreInterests)
          const Text(
            '...',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
      ],
    );
  }
}

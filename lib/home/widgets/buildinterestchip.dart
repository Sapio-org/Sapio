import 'package:flutter/material.dart';

Widget buildInterestChip(String label) {
  return Container(
    margin: EdgeInsets.only(right: 3),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        const Icon(Icons.local_dining, size: 16, color: Colors.black),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}

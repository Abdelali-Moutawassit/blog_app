import 'package:flutter/material.dart';

Widget musicInfo() {
  return Positioned(
    bottom: 15,
    left: 20,
    right: 20,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Work Discipline & Business Life",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Praesent quis est et neque euismod tincidunt",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 5),
        const Text("2,494,435 likes", style: TextStyle(color: Colors.white70)),
        Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.orange,
            child: const Icon(Icons.play_arrow, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

Widget buildVoiceMessage(bool isMe) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.play_arrow, color: isMe ? Colors.white : Colors.black),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 4,
            decoration: BoxDecoration(
              color: isMe ? Colors.white70 : Colors.black26,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(
          '0:12',
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black87,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

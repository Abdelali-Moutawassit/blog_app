import 'package:blog_app/features/Music/presentation/screens/music_screen.dart';
import 'package:blog_app/pagesFake/notification_page.dart';
import 'package:flutter/material.dart';

Widget topBar(double screenWidth, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        'assets/images/logoApp.png',
        height: screenWidth > 600 ? 50 : 40,
      ),
      Row(
        children: [
          _styledIconButton(
            iconAsset: 'assets/images/not.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  NotificationPage(),
                ),
              );
            },
            count: 3,
          ),
          const SizedBox(width: 12),
          _styledIconButton(
            iconAsset: 'assets/images/mes.png',
            onTap: () {},
            count: 5,
          ),
          const SizedBox(width: 12),
          _styledIconButton(
            iconAsset: 'assets/images/mus.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MusicScreen()),
              );
            },
            count: 5,
          ),
        ],
      ),
    ],
  );
}

Widget _styledIconButton({
  IconData? icon,
  String? iconAsset,
  required VoidCallback onTap,
  int count = 0,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child:
                iconAsset != null
                    ? Image.asset(
                      iconAsset,
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    )
                    : Icon(icon, color: Colors.black87, size: 22),
          ),
        ),
      ),
      if (count > 0)
        Positioned(
          right: -4,
          top: -4,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
            child: Center(
              child: Text(
                count > 99 ? '99+' : '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}

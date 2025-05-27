import 'package:flutter/material.dart';

Widget buildReelsSection() {
  final List<Map<String, String>> reels = [
    {
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutUq-QRLeof9NcnMd4ntzLPVhfEMUtWudFA&s',
      'username': 'amine.dev',
    },
    {
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT_aUO9JBrDsBxvYBAys9hjPh1G-kD2WI7pA&s',
      'username': 'fatima.art',
    },
    {
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-a52zkAYZe_ER_Afb5vSLwWJWouDKlO4iZA&s',
      'username': 'youssef_fitness',
    },
    {
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHHBiWMC8DPfakodQYS2XNLjMJOxiocpCq_w&s',
      'username': 'musicvibes',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 160,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: reels.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final reel = reels[index];
            return GestureDetector(
              onTap: () {
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      reel['thumbnail']!,
                      width: 100,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      '@${reel['username']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 6,
                    right: 6,
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

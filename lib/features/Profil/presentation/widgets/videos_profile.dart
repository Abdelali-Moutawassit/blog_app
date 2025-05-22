import 'package:flutter/material.dart';

Widget videosProfile() {
  final List<Map<String, String>> videos = [
    {
      'thumbnail': 'https://img.youtube.com/vi/5qap5aO4i9A/maxresdefault.jpg',
      'title': 'Lofi Chill Mix',
      'duration': '1:02:36',
    },
    {
      'thumbnail':
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/youtube-thumbnail-template-design-5fa9cd79a6367f8446a5208e4540a493_screen.jpg?ts=1699135222',
      'title': 'Nature Relaxation',
      'duration': '25:14',
    },
    {
      'thumbnail':
          'https://cdn-images.dzcdn.net/images/cover/60d452f58d6eba3300cf245786e24b65/0x1900-000000-80-0-0.jpg',
      'title': 'Deep Focus Music',
      'duration': '45:00',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Text(
          "Mes vidéos",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: videos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final video = videos[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(video['thumbnail']!, fit: BoxFit.cover),
                ),
                Container(color: Colors.black.withValues(alpha: 0.3)),
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      video['duration']!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(
                    video['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      const SizedBox(height: 16),
    ],
  );
}

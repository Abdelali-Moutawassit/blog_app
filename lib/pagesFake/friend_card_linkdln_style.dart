import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_app/core/theme/colors.dart';

class FriendCardLinkedInStyle extends StatelessWidget {
  final String name;
  final String coverUrl;
  final String profileUrl;
  final String mutualInfo;
  final VoidCallback onFollow;
  final VoidCallback onClose;

  const FriendCardLinkedInStyle({
    super.key,
    required this.name,
    required this.coverUrl,
    required this.profileUrl,
    required this.mutualInfo,
    required this.onFollow,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  coverUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: onClose,
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.close, size: 14, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                left: 40,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(profileUrl),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  mutualInfo,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 8),
                    Text(
                      '4.9 (128 avis)',
                      style: GoogleFonts.poppins(fontSize: screenWidth * 0.035),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: onFollow,
                  icon: const Icon(Icons.favorite_border, size: 16),
                  label: const Text(
                    "Follower",
                    style: TextStyle(fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(130, 36),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

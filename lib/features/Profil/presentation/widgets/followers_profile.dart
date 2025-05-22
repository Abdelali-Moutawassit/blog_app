import 'package:flutter/material.dart';

Widget followersProfile() {
  final List<Map<String, dynamic>> followers = [
    {
      'name': 'Yasmine B.',
      'image': 'https://randomuser.me/api/portraits/women/12.jpg',
      'isFollowing': true,
    },
    {
      'name': 'Hicham D.',
      'image': 'https://randomuser.me/api/portraits/men/28.jpg',
      'isFollowing': false,
    },
    {
      'name': 'Nada M.',
      'image': 'https://randomuser.me/api/portraits/women/45.jpg',
      'isFollowing': true,
    },
    {
      'name': 'Rayan Z.',
      'image': 'https://randomuser.me/api/portraits/men/65.jpg',
      'isFollowing': false,
    },
    // Ajoute plus de followers ici si besoin
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Text(
          "Mes followers",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: followers.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final follower = followers[index];
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(follower['image']),
              radius: 24,
            ),
            title: Text(
              follower['name'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    follower['isFollowing'] ? Colors.grey[300] : Colors.blue,
                foregroundColor:
                    follower['isFollowing'] ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                follower['isFollowing'] ? 'Abonné(e)' : 'Suivre',
              ),
            ),
          );
        },
      ),
      const SizedBox(height: 16),
    ],
  );
}

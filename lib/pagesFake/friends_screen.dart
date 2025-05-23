import 'package:flutter/material.dart';
import 'package:blog_app/pagesFake/friend_card_linkdln_style.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = List.generate(9, (index) {
      return {
        "name": "Personne ${index + 1}",
        "coverUrl": "https://randomuser.me/api/portraits/men/${index + 10}.jpg",
        "profileUrl":
            "https://randomuser.me/api/portraits/men/${index + 10}.jpg",
        "mutualInfo": "${index * 5 + 10} relations en commun",
      };
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Suggestions",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth >= 800 ? 3 : 2;

            return GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: 250,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = data[index];
                return FriendCardLinkedInStyle(
                  name: item['name']!,
                  coverUrl: item['coverUrl']!,
                  profileUrl: item['profileUrl']!,
                  mutualInfo: item['mutualInfo']!,
                  onFollow: () => debugPrint('Follower ${item['name']}'),
                  onClose: () => debugPrint('Supprimer ${item['name']}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

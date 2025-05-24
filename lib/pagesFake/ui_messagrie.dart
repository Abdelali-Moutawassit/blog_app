import 'package:flutter/material.dart';

class UiMessagrie extends StatelessWidget {
  const UiMessagrie({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        "name": "Airtel",
        "time": "2:23PM",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": null,
        "unread": true,
        "count": 3
      },
      {
        "name": "Linda",
        "time": "1:00PM",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": "https://randomuser.me/api/portraits/women/65.jpg",
      },
      {
        "name": "MTN4ME",
        "time": "5:00PM",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": null,
      },
      {
        "name": "ExtraCredit",
        "time": "12 Oct",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": null,
      },
      {
        "name": "Emeka",
        "time": "12 Oct",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": "https://randomuser.me/api/portraits/men/50.jpg",
      },
      {
        "name": "Louisa",
        "time": "23 Oct",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": "https://randomuser.me/api/portraits/women/81.jpg",
      },
      {
        "name": "Mark",
        "time": "30 Sep",
        "subtitle": "Lorem ipsum dolor sit amet...",
        "image": "https://randomuser.me/api/portraits/men/80.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A1E2A),
      appBar: AppBar(
        title: const Text("Indox", style: TextStyle(fontSize: 22)),
        backgroundColor: const Color(0xFF0A1E2A),
        elevation: 0,
        actions: const [
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) {
          final msg = messages[index];
          return ListTile(
            leading: msg["image"] != null
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(msg["image"] as String),
                  )
                : CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.person, color: Colors.purple),
                  ),
            title: Text(
              msg["name"] as String,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: Text(
              msg["subtitle"] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  msg["time"] as String,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
                ),
                if (msg["unread"] == true)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg["count"].toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

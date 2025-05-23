import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'name': 'Jenny Wilson',
        'message': 'Hi Peter! Do u want 2 come 2 the cinema tonight?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/women/79.jpg',
        'unread': false,
      },
      {
        'name': 'Theresa Webb',
        'message':
            "That's great! I'm doing well, too. I am just messaging to ask if we ...",
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/women/44.jpg',
        'unread': true,
        'unreadCount': 1,
      },
      {
        'name': 'Wade Warren',
        'message': 'Hi man! What film?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/45.jpg',
        'unread': false,
      },
      {
        'name': 'Courtney Henry',
        'message': 'Do you have any holidays coming up?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/12.jpg',
        'unread': false,
      },
      {
        'name': 'Ronald Richards',
        'message': 'Is this your first time in Berlin?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/32.jpg',
        'unread': true,
        'unreadDot': true,
      },
      {
        'name': 'Jenny Wilson',
        'message': 'Hi Peter! Do u want 2 come 2 the cinema tonight?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/women/79.jpg',
        'unread': false,
      },
      {
        'name': 'Theresa Webb',
        'message':
            "That's great! I'm doing well, too. I am just messaging to ask if we ...",
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/women/44.jpg',
        'unread': true,
        'unreadCount': 1,
      },
      {
        'name': 'Wade Warren',
        'message': 'Hi man! What film?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/45.jpg',
        'unread': false,
      },
      {
        'name': 'Courtney Henry',
        'message': 'Do you have any holidays coming up?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/12.jpg',
        'unread': false,
      },
      {
        'name': 'Ronald Richards',
        'message': 'Is this your first time in Berlin?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/32.jpg',
        'unread': true,
        'unreadDot': true,
      },
      {
        'name': 'Jenny Wilson',
        'message': 'Hi Peter! Do u want 2 come 2 the cinema tonight?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/women/79.jpg',
        'unread': false,
      },
      {
        'name': 'Theresa Webb',
        'message':
            "That's great! I'm doing well, too. I am just messaging to ask if we ...",
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/women/44.jpg',
        'unread': true,
        'unreadCount': 1,
      },
      {
        'name': 'Wade Warren',
        'message': 'Hi man! What film?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/45.jpg',
        'unread': false,
      },
      {
        'name': 'Courtney Henry',
        'message': 'Do you have any holidays coming up?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/12.jpg',
        'unread': false,
      },
      {
        'name': 'Ronald Richards',
        'message': 'Is this your first time in Berlin?',
        'time': '1 hour',
        'image': 'https://randomuser.me/api/portraits/men/32.jpg',
        'unread': true,
        'unreadDot': true,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Icon(Icons.search, size: 26),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: NetworkImage(
                                  message['image'] as String,
                                ),
                              ),
                              if (message['unreadDot'] == true)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['name'] as String,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  message['message'] as String,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                message['time'] as String,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              if (message['unread'] == true &&
                                  message['unreadCount'] != null)
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF1E5EF3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    message['unreadCount'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1E5EF3),
        onPressed: () {},
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

import 'package:blog_app/features/Messagerie/presentation/screens/appel_music_screen.dart';
import 'package:blog_app/features/Messagerie/presentation/screens/appel_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessagesItemScreen extends StatelessWidget {
  const MessagesItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'isMe': false,
        'text': "Hey, What's up?",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 12)),
      },
      {
        'isMe': false,
        'text': "😊 😘",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 11)),
      },
      {
        'isMe': true,
        'text': "Not Much, Just Hanging Out. How About You?",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 10)),
      },
      {
        'isMe': false,
        'text': "Same Here. Did You End Up Watching That Movie I Recommended?",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 9)),
      },
      {
        'isMe': true,
        'text': "Yeah, I Did. It Was Really Good. Thanks For The Suggestion!",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 8)),
      },
      {
        'isMe': false,
        'text': "No Problem. What Are You Up To Later?",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 7)),
      },
      {
        'isMe': true,
        'text':
            "Not Sure Yet. Maybe Just Going To Grab Some Food. How About You?",
        'type': 'text',
        'time': DateTime.now().subtract(Duration(minutes: 6)),
      },
      {
        'isMe': false,
        'type': 'voice',
        'duration': '0:12',
        'time': DateTime.now().subtract(Duration(minutes: 5)),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/women/44.jpg",
              ),
              radius: 18,
            ),
            SizedBox(width: 10),
            Text(
              "Sophia Hernan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppelMusicScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppelVideoScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg['isMe'] as bool;
                final type = msg['type'] ?? 'text';
                final time = msg['time'] as DateTime;
                final alignment =
                    isMe ? Alignment.centerRight : Alignment.centerLeft;
                final color =
                    isMe ? const Color(0xFF3B82F6) : Colors.grey.shade200;
                final textColor = isMe ? Colors.white : Colors.black87;

                return Align(
                  alignment: alignment,
                  child: Column(
                    crossAxisAlignment:
                        isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:
                            type == 'text'
                                ? Text(
                                  msg['text'] as String,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                  ),
                                )
                                : _buildVoiceMessage(isMe),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 4,
                          right: 4,
                        ),
                        child: Text(
                          DateFormat('hh:mm a').format(time),
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Message de saisie "en cours"
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Sophia est en train d’écrire...",
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildVoiceMessage(bool isMe) {
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

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.grey),
          const SizedBox(width: 12),
          const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF3B82F6)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

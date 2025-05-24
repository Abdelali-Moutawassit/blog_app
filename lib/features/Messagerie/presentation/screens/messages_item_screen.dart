import 'package:blog_app/features/Messagerie/presentation/screens/appel_music_screen.dart';
import 'package:blog_app/features/Messagerie/presentation/screens/appel_video_screen.dart';
import 'package:blog_app/db/messagrieItemPage/message_item_db.dart';
import 'package:blog_app/features/Messagerie/presentation/widgets/build_message_input.dart';
import 'package:blog_app/features/Messagerie/presentation/widgets/build_voice_message.dart';
import 'package:blog_app/pagesFake/info_contact.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessagesItemScreen extends StatelessWidget {
  const MessagesItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InfoContact()),
            );
          },
          child: Row(
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
                                : buildVoiceMessage(isMe),
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
          buildMessageInput(context),
        ],
      ),
    );
  }
}

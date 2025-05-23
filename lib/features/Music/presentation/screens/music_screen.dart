import 'package:blog_app/features/Music/presentation/widgets/music_info.dart';
import 'package:blog_app/features/Music/presentation/widgets/music_player_card.dart';
import 'package:blog_app/features/Music/presentation/widgets/podcast_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light, // white icons in status bar
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFFF7F7F7),
          body: Stack(
            children: [
              // Background image behind the status bar
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/podcast_cover.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Main content
              SafeArea(
                child: Column(
                  children: [
                    // Header Section
                    Stack(
                      children: [
                        Container(
                          height: 350,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 15,
                          child: CircleAvatar(
                            backgroundColor: Colors.black45,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 10,
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        // Music Info Widget
                        musicInfo(),
                      ],
                    ),

                    // Podcast List
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                        children: [
                          podcastItem(
                            title: "Can we talk about business life?",
                            author: "Lurch Schpellcheck",
                            date: "17 Oct 2022",
                            progress: 0.5,
                            duration: "15 min left",
                            image: "assets/images/user1.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Another Perspective",
                            author: "Lurch Schpellcheck",
                            date: "17 Oct 2022",
                            image: "assets/images/user2.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Brief History of Economy",
                            author: "Hugh Saturation",
                            date: "17 Oct 2022",
                            image: "assets/images/user3.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "All We Are We",
                            author: "Hugh Saturation",
                            date: "10 Oct 2023",
                            image: "assets/images/user3.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Brief History of Economy",
                            author: "Hugh Saturation",
                            date: "17 Oct 2022",
                            image: "assets/images/user3.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Brief History of Economy",
                            author: "Hugh Saturation",
                            date: "17 Oct 2022",
                            image: "assets/images/user3.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Brief History of Economy",
                            author: "Hugh Saturation",
                            date: "17 Oct 2022",
                            image: "assets/images/user3.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Brief History of Economy",
                            author: "Hugh Saturation",
                            date: "17 Oct 2022",
                            image: "assets/images/user3.png",
                          ),
                          const SizedBox(height: 20),
                          podcastItem(
                            title: "Brief History of Economy",
                            author: "Hugh Saturation",
                            date: "17 Oct 2022",
                            image: "assets/images/user3.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Fixed bottom music player card
              musicPlayerCard(),
            ],
          ),
        ),
      ),
    );
  }
}

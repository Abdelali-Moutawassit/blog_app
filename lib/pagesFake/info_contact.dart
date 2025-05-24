import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoContact extends StatelessWidget {
  const InfoContact({super.key});

  @override
  Widget build(BuildContext context) {
    // Pour rendre la page full screen (sans les bandes noires)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light, // Pour texte blanc sur le haut
        child: Stack(
          children: [
            // Background image plein écran jusqu'en haut
            Container(
              height: 240,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=800&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Bouton retour
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    const SizedBox(height: 100),

                    // Avatar
                    CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.white,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/65.jpg',
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    const Text(
                      'Ophelia Coleman',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Los Angeles, CA',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'I’m a positive person. I love to travel and eat.\nAlways available for chat',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message),
                          color: Colors.blue,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _StatColumn(label: "Following", value: "870"),
                        _StatColumn(label: "Followers", value: "120k"),
                        _StatColumn(label: "Likes", value: "354k"),
                      ],
                    ),
                    const SizedBox(height: 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "View All",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: const [
                          _FollowerAvatar(
                            name: "Isaiah",
                            imageUrl:
                                'https://randomuser.me/api/portraits/men/31.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Jayden",
                            imageUrl:
                                'https://randomuser.me/api/portraits/men/18.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Hunter",
                            imageUrl:
                                'https://randomuser.me/api/portraits/men/5.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Ethel",
                            imageUrl:
                                'https://randomuser.me/api/portraits/women/60.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Isaiah",
                            imageUrl:
                                'https://randomuser.me/api/portraits/men/31.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Jayden",
                            imageUrl:
                                'https://randomuser.me/api/portraits/men/18.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Hunter",
                            imageUrl:
                                'https://randomuser.me/api/portraits/men/5.jpg',
                          ),
                          _FollowerAvatar(
                            name: "Ethel",
                            imageUrl:
                                'https://randomuser.me/api/portraits/women/60.jpg',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Posts",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: const [
                          _PostImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=60',
                          ),
                          _PostImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=60',
                          ),
                          _PostImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=60',
                          ),
                          _PostImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=60',
                          ),
                          _PostImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=60',
                          ),
                          _PostImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=60',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _FollowerAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;
  const _FollowerAvatar({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  final String imageUrl;
  const _PostImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

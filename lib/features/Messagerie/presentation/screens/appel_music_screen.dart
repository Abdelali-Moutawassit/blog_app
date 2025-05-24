import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AppelMusicScreen extends StatefulWidget {
  const AppelMusicScreen({super.key});

  @override
  State<AppelMusicScreen> createState() => _AppelMusicPageState();
}

class _AppelMusicPageState extends State<AppelMusicScreen>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSound();
  }

  Future<void> _playSound() async {
    try {
      await _player.play(
        UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
        volume: 1.0,
      );
    } catch (e) {
      debugPrint("Erreur lors de la lecture audio : $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Icon(Icons.lock, size: 20, color: Colors.white),
                SizedBox(height: 4),
                Text(
                  'End-to-end Encrypted',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Kateryna Warren',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Audio Call',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedCallButton(
                  icon: Icons.call_end,
                  color: Colors.red,
                  onPressed: () {
                    _player.stop();
                    Navigator.pop(context);
                  },
                ),
                AnimatedCallButton(
                  icon: Icons.call,
                  color: Colors.green,
                  onPressed: () {
                    // Accepter l'appel
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCallButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const AnimatedCallButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  State<AnimatedCallButton> createState() => _AnimatedCallButtonState();
}

class _AnimatedCallButtonState extends State<AnimatedCallButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true); // boucle infinie
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: widget.onPressed,
        backgroundColor: widget.color,
        child: Icon(widget.icon, size: 28),
      ),
    );
  }
}

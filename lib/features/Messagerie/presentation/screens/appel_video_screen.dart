import 'package:flutter/material.dart';

class AppelVideoScreen extends StatelessWidget {
  const AppelVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ✅ Vidéo principale (l'autre utilisateur)
          Positioned.fill(
            child: Image.network(
              'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
              fit: BoxFit.cover,
            ),
          ),

          // ✅ AppBar simplifiée avec nom de l’utilisateur
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Lucas Jonas',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),

          // ✅ Miniature vidéo de l'utilisateur local
          Positioned(
            bottom: 140,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54, width: 2),
                ),
                child: Image.network(
                  'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ✅ Boutons d'appel en bas
          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _callButton(Icons.switch_camera, Colors.white),
                _callButton(Icons.videocam_off, Colors.red),
                _callButton(Icons.mic, Colors.white),
                _callButton(
                  Icons.call_end,
                  Colors.red,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _callButton(IconData icon, Color bgColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: bgColor.withOpacity(0.9),
        child: Icon(icon, color: Colors.black, size: 26),
      ),
    );
  }
}

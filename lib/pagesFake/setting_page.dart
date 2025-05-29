import 'package:blog_app/features/Music/presentation/screens/music_screen.dart';
import 'package:blog_app/features/PostTest/presentation/widgets/styled_icon_button.dart';
import 'package:blog_app/features/Profile/presentation/screens/profile_screen.dart';
import 'package:blog_app/pagesFake/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/527343577/photo/looking-for-inspiration.jpg?s=612x612&w=0&k=20&c=ck3lswRHkRpvxurShBPaRj5dvieSo1N0ZPqXA4XdOnk=',
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "James Adams",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "@james_adams",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          styledIconButton(
            iconAsset: 'assets/images/mus.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MusicScreen()),
              );
            },
            count: 5,
          ),
          styledIconButton(
            iconAsset: 'assets/images/not.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
            count: 3,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            _buildSettingItem(
              icon: LucideIcons.user,
              title: 'Profile settings',
              subtitle: 'Settings regarding your profile',
              onTap: () {},
            ),
            _buildSettingItem(
              icon: LucideIcons.newspaper,
              title: 'News settings',
              subtitle: 'Choose your favourite topics',
              onTap: () {},
            ),
            _buildSettingItem(
              icon: LucideIcons.bell,
              title: 'Notifications',
              subtitle: 'When would you like to be notified',
              onTap: () {},
            ),
            _buildSettingItem(
              icon: LucideIcons.wallet,
              title: 'Subscriptions',
              subtitle: 'Currently, you are in Starter Plan',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                'Other',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            _buildSettingItem(
              icon: LucideIcons.bug,
              title: 'Bug report',
              subtitle: 'Report bugs very easily',
              onTap: () {},
            ),
            _buildSettingItem(
              icon: LucideIcons.share2,
              title: 'Share the app',
              subtitle: 'Share on social media networks',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFE8ECF4),
            child: Icon(icon, color: Colors.black87),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}

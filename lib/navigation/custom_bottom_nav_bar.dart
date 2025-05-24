import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background container with rounded corners
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem('assets/images/home.png', 0, currentIndex),
                _buildNavItem('assets/images/user.png', 1, currentIndex),
                _buildNavItem(
                  'assets/images/add.png',
                  2,
                  currentIndex,
                  isLarge: true,
                ),
                _buildNavItem('assets/images/message.png', 3, currentIndex),
                _buildProfileItem(4, currentIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    String iconPath,
    int index,
    int selectedIndex, {
    bool isLarge = false,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Image.asset(
          iconPath,
          width: isLarge ? 40 : 24,
          height: isLarge ? 40 : 24,
          color: index == selectedIndex ? Colors.amber : Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildProfileItem(int index, int selectedIndex) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
          'https://randomuser.me/api/portraits/men/73.jpg',
        ),
        child:
            index == selectedIndex
                ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.amber, width: 2),
                  ),
                )
                : null,
      ),
    );
  }
}

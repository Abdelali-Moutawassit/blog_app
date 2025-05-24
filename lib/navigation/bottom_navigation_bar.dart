import 'package:flutter/material.dart';

Widget bottomNavigationBar(int currentIndex, void Function(int) onTap) {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    currentIndex: currentIndex,
    onTap: onTap,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: const [
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/images/home.png'),
          backgroundColor: Colors.transparent,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/images/user.png'),
          backgroundColor: Colors.transparent,
        ),
        label: 'Article',
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/add.png'),
          backgroundColor: Colors.transparent,
        ),
        label: 'Create',
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 13,
          backgroundImage: AssetImage('assets/images/message.png'),
          backgroundColor: Colors.transparent,
        ),
        label: 'Message',
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/men/73.jpg',
          ),
          backgroundColor: Colors.transparent,
        ),
        label: 'ABDELALI',
      ),
    ],
  );
}

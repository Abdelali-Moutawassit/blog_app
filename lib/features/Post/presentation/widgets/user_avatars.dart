import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAvatars extends StatelessWidget {
  const UserAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    final userList = [
      'Emilia',
      'Richard',
      'Jasmine',
      'Lucas',
      'Ava',
      'Show',
      'Look',
    ];

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=${index + 10}',
                ),
              ),
              const SizedBox(height: 4),
              Text(userList[index], style: GoogleFonts.poppins(fontSize: 10)),
            ],
          );
        },
      ),
    );
  }
}

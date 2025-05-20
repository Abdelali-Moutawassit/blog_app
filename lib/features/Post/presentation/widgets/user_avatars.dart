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
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: userList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 15),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=${index + 10}',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          userList[index],
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ],
                    );
                  },
                ),
              );
  }
}
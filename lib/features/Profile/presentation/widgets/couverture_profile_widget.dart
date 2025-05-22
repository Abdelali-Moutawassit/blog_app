import 'package:flutter/material.dart';

Widget couvertureProfileWidget(context,screenHeight,screenWidth) {
  return SliverToBoxAdapter(
    child: Stack(
      children: [
        SizedBox(
          height: screenHeight * 0.35,
          width: double.infinity,
          child: PageView(
            children: [
              Image.network(
                'https://res.cloudinary.com/jerrick/image/upload/d_642250b563292b35f27461a7.png,f_jpg,q_auto,w_720/6734c53e768161001d967de6.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.network(
                'https://res.cloudinary.com/jerrick/image/upload/d_642250b563292b35f27461a7.png,f_jpg,q_auto,w_720/6734c8df768161001d967e26.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.network(
                'https://i.pinimg.com/236x/68/6a/95/686a956701f6201ed8e9b77ffc25fd33.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_W0lVO3NROOEnzAFgH8ENVGsyydvLvbDaM2DTkN3oX6z2xDf7-dSFNEOvl-GjnijiFs&usqp=CAU',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
        ),

        // Barre d'actions superposée en haut (flèche, coeur, 3 points)
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  PopupMenuButton<String>(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.more_vert, color: Colors.white),
                    ),
                    onSelected: (value) {},
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: 'details',
                          child: Text('En savoir plus'),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight * 0.12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withValues(alpha: 0.3), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -screenWidth * 0.0001,
          left: (screenWidth - screenWidth * 0.24) / 2,
          child: CircleAvatar(
            radius: screenWidth * 0.12,
            backgroundImage: const NetworkImage(
              'https://randomuser.me/api/portraits/men/65.jpg',
            ),
          ),
        ),
      ],
    ),
  );
}

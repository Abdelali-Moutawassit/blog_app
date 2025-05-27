import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryList = [
      {
        'title': 'Technology',
        'image':
            'https://www.repsol.com/content/dam/repsol-corporate/es/energia-e-innovacion/Computaci%C3%B3n-cu%C3%A1ntica-qu%C3%A9-es.jpg',
      },
      {
        'title': 'Adventure',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOZoBO9iP5lrtUG9xALRSkkZLNOKNosP-Qw&s',
      },
      {
        'title': 'Comedy',
        'image':
            'https://m.media-amazon.com/images/M/MV5BNjllYWQ5YjgtY2MzYi00OWY3LTg1YmQtNzU1ZThmNjY0M2NmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      },
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final category = categoryList[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(category['image']!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  category['title']!,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

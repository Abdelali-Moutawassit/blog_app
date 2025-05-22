import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget infoUtilisateurWidget(screenWidth,{required String username}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Nom
          Text(
            username,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 8),

          // Boutons Appeler et Message sous le nom, icônes rondes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.call, color: Colors.black, size: 28),
                ),
              ),

              const SizedBox(width: 24),

              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.message,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Métier + Adresse
          Text(
            'Makeup Artist • Casablanca, Maroc',
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Étoile unique + nombre d’avis
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 18, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                '4.9 (128 avis)',
                style: GoogleFonts.poppins(fontSize: screenWidth * 0.035),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Description personnelle (même taille, style changé)
          Text(
            "Passionnée par la mise en valeur naturelle de chaque visage. Avec plus de 6 ans d'expérience, je propose des prestations sur mesure pour sublimer votre beauté à chaque occasion.",
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.036,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Widget navigationProfile({
  required int selectedIndex,
  required Function(int index) onTabSelected,
}) {
  final List<String> tabs = ['Posts', 'Images', 'Videos', 'Followers', 'Info'];

  return SliverToBoxAdapter(
    child: SizedBox(
      height: 40, // plus petite hauteur
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFFD700) : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              203,
                              174,
                              6,
                            ).withValues(alpha: 0.6),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : [],
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey[800],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

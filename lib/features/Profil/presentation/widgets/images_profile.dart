import 'package:flutter/material.dart';

Widget imagesProfile() {
  final List<String> imageUrls = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-K2Qe5N26HdG0jQWBEHxZYETyuxdBDUfhzA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk7aiIqYwSNR3FlHmFviH8GoEY9atQsYPviw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ718nztPNJfCbDJjZG8fOkejBnBAeQw5eAUA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVNN58XFDLxdqtwwWRSE924NjtuSryXFGxjg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBcwPKg2wLS1Ge5bXSwIY-o0zBYVqhtV7ZJn76TCXsFmI8HIpuDt6ip5vEBFvSWlDGpJs&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ1ipeQbFseUM_GzxwMoQj45w9HtAnu4eu5w&s",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Text(
          "Galerie d'images",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: imageUrls.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
          );
        },
      ),
      const SizedBox(height: 16),
    ],
  );
}

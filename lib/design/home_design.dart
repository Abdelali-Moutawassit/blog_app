import 'package:flutter/material.dart';

class HomeDesign extends StatelessWidget {
  final List<String> stories = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
  ];

  final List<String> storyNames = ['Fernanda', 'James', 'Estefania', 'Fan'];

  HomeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
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
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Stories
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(stories[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(storyNames[index], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
            ),
          ),
          SizedBox(height: 16),
          // Photo & Video buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                label: Text("Photo"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.videocam),
                label: Text("Video"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Post
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Angelina Hall",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2 hours ago",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("I have just spent 3 amazing days in my home town! 😍"),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Liked by rebecca_jones and 155 others"),
                  ],
                ),
                SizedBox(height: 5),
                Text("Tag someone you’d take here ❤️ Buon giorno ❤️ FOLLOW"),
                Text("dirkhensiek_hh: Very nice"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Angelina Hall",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2 hours ago",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("I have just spent 3 amazing days in my home town! 😍"),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Liked by rebecca_jones and 155 others"),
                  ],
                ),
                SizedBox(height: 5),
                Text("Tag someone you’d take here ❤️ Buon giorno ❤️ FOLLOW"),
                Text("dirkhensiek_hh: Very nice"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Angelina Hall",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2 hours ago",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("I have just spent 3 amazing days in my home town! 😍"),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Liked by rebecca_jones and 155 others"),
                  ],
                ),
                SizedBox(height: 5),
                Text("Tag someone you’d take here ❤️ Buon giorno ❤️ FOLLOW"),
                Text("dirkhensiek_hh: Very nice"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

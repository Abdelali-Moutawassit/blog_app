import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "type": "receive",
      "amount": "150.00",
      "from": "Jacob Alison",
      "image": "https://randomuser.me/api/portraits/men/10.jpg",
    },
    {
      "type": "receive",
      "amount": "150.00",
      "from": "Jessica Munson",
      "image": "https://randomuser.me/api/portraits/women/21.jpg",
    },
    {
      "type": "send",
      "amount": "150.00",
      "to": "Jacob Alison",
      "image": "https://randomuser.me/api/portraits/men/10.jpg",
    },
    {
      "type": "receive",
      "amount": "150.00",
      "from": "Bella Thanks",
      "image": "https://randomuser.me/api/portraits/women/11.jpg",
    },
    {
      "type": "send",
      "amount": "150.00",
      "to": "Carl Jacobson",
      "image": "https://randomuser.me/api/portraits/men/12.jpg",
    },
    {
      "type": "send",
      "amount": "150.00",
      "to": "Jessica Munson",
      "image": "https://randomuser.me/api/portraits/women/21.jpg",
    },
    {
      "type": "send",
      "amount": "150.00",
      "to": "Jessica Munson",
      "image": "https://randomuser.me/api/portraits/women/21.jpg",
    },
    {
      "type": "send",
      "amount": "150.00",
      "to": "Jessica Munson",
      "image": "https://randomuser.me/api/portraits/women/21.jpg",
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFDF7F4),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 80, bottom: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF7F50),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "See What's Up!",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      itemCount: notifications.length,
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = notifications[index];
                        final isReceive = item['type'] == 'receive';
                        final name = item['from'] ?? item['to'];
                        final imageUrl = item['image']!;
                        final icon =
                            isReceive
                                ? Icons.arrow_downward
                                : Icons.arrow_upward;
                        final iconColor = isReceive ? Colors.green : Colors.red;
                        final text =
                            isReceive
                                ? "You just received \$${item['amount']} from $name"
                                : "You just transferred \$${item['amount']} to $name";

                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 26,
                                    backgroundImage: NetworkImage(imageUrl),
                                  ),
                                  Positioned(
                                    bottom: -2,
                                    right: -2,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        icon,
                                        size: 14,
                                        color: iconColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Back button integrated in stack
            Positioned(
              top: 40,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

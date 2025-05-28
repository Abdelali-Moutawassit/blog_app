// import 'package:flutter/material.dart';

// Widget _buildProfileItem(int index, int selectedIndex) {
//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: CircleAvatar(
//         radius: 16,
//         backgroundColor: Colors.transparent,
//         backgroundImage: NetworkImage(
//           'https://randomuser.me/api/portraits/men/74.jpg',
//         ),
//         child:
//             index == selectedIndex
//                 ? Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.amber, width: 2),
//                   ),
//                 )
//                 : null,
//       ),
//     );
//   }
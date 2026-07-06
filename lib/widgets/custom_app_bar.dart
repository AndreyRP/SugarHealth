import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF00A88F),
      elevation: 0,
      title: Row(
        children: [
          Icon(Icons.water_drop, color: Colors.orange[300], size: 28),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SUGAR HEALTH',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(
                'Treinos Físicos',
                style: TextStyle(fontSize: 11, color: Colors.grey[800]),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: Icon(Icons.person, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
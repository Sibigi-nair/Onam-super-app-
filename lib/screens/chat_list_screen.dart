import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  final List<Map<String, String>> users = const [
    {'id': '1', 'name': 'Rahul', 'message': 'Hello!'},
    {'id': '2', 'name': 'Priya', 'message': 'How are you?'},
    {'id': '3', 'name': 'Amit', 'message': 'See you soon'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Messages', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: const Icon(Icons.person, color: AppColors.primary),
            ),
            title: Text(user['name']!),
            subtitle: Text(user['message']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    chatUserId: user['id']!,
                    chatUserName: user['name']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

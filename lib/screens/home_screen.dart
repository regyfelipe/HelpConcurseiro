import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/home_grid.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: user.avatar.isNotEmpty
                  ? MemoryImage(base64Decode(user.avatar))
                  : AssetImage('assets/images/default_avatar.png')
                      as ImageProvider,
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              'Olá, ${user.preferredName}!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: HomeGrid(), 
    );
  }
}

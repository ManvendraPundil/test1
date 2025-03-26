// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:q_mart/pages/auth_page.dart';
import 'package:q_mart/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.person_4,
              size: 40,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Details'),
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Your Orders'),
          ),
          ListTile(
            onTap: () async {
              await AuthService.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthPage(),
                ),
                (route) => false,
              );
            },
            leading: Icon(Icons.logout),
            title: Text('Log out'),
          ),
        ],
      ),
    );
  }
}

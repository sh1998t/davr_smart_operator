import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('profile Screen'),
      ),
      body:Center(
        child: Text('Profile screen'),
      ),
    );
  }
}

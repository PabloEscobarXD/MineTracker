import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 238, 144, 1),
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          SizedBox(height: 32),
          Center(child: Icon(Icons.person, size: 100)),
          SizedBox(height: 8),
          Text(
            "Pablo Escobar",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

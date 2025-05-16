  import 'package:flutter/material.dart';
  import '../data/globals.dart';


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
        body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(child: Icon(Icons.person, size: 100)),
          const SizedBox(height: 8),
          const Text(
            "Pablo Escobar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Text("Historial de Objetivos Cumplidos", style: TextStyle(fontSize: 20)),
          const Divider(),
          ...historialObjetivos,
        ],
      )

      );
    }
  }

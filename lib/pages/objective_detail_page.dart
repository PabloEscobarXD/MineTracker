import 'package:flutter/material.dart';

class ObjectiveDetailPage extends StatelessWidget {
  final IconData icon;
  final String name;
  final String description;
  final bool isCompleted;

  const ObjectiveDetailPage({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 64),
            const SizedBox(height: 16),
            Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            if (isCompleted)
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text("Objetivo ya completado", style: TextStyle(fontSize: 16)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

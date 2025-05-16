import 'package:flutter/material.dart';

// Función para WorldCard
Widget buildWorldCard({
  required String imagePath,
  required String title,
  required String subtitle,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Función para ObjectiveCard
Widget buildObjectiveCard({
  required IconData icon,
  required String name,
  required String description,
  required VoidCallback onCompleted,
  VoidCallback? onTapDetail,
  bool readOnly = false,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: ListTile(
      onTap: onTapDetail,
      leading: Icon(icon),
      title: Text(name),
      trailing: readOnly
          ? const Icon(Icons.check_box, color: Colors.green)
          : IconButton(
              icon: const Icon(Icons.check_box_outline_blank),
              onPressed: onCompleted,
            ),
    ),
  );
}

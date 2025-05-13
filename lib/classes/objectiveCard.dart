import 'package:flutter/material.dart';

class ObjectiveCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String description;
  final VoidCallback onDetails;

  const ObjectiveCard({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDetails,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(icon, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

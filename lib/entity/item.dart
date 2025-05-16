import 'package:flutter/material.dart';

class Item {
  final String name;
  final String description;
  final String difficulty;
  final List<String> craftingImages;
  final IconData icon;

  Item({
    required this.name,
    required this.description,
    required this.difficulty,
    required this.craftingImages,
    required this.icon,
  });
}

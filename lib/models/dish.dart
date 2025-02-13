import 'package:flutter/material.dart';

class Dish {
  final String name;
  final String description;
  final String iconPath;
  final Color color;
  
  Dish({
    required this.name,
    required this.description,
    required this.iconPath,
    required this.color,
  });
}
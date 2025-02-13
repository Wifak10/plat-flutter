import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryChip extends StatelessWidget {
  final String label;

  CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color.fromARGB(255, 135, 124, 246),
      label: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('icons/plate.svg', width: 24, height: 24),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
      
    );
  }
}
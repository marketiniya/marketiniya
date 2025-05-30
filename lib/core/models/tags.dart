import 'package:flutter/material.dart';

class Tag {
  const Tag({
    required this.id,
    required this.label,
    required this.color,
  });

  final String id;
  final String label;
  final Color color;
}
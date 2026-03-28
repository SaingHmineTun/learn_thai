import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final String shanTitle;
  final IconData icon;
  final Color color;
  final Widget targetScreen;

  DashboardItem({
    required this.title,
    required this.shanTitle,
    required this.icon,
    required this.color,
    required this.targetScreen,
  });
}
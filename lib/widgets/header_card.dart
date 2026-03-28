import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final String shanSubtitle;
  final String description;
  final Color themeColor;

  HeaderCard({
    required this.title,
    required this.shanSubtitle,
    required this.description,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.fromBorderSide(BorderSide(color: themeColor, width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          Text(
            shanSubtitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

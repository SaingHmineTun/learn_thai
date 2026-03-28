import 'package:flutter/material.dart';

enum ThaiCategory { travel, shopping, eating, greeting }

extension ThaiCategoryExtension on ThaiCategory {
  String get title => toString().split('.').last.toUpperCase();

  String get shanTitle {
    switch (this) {
      case ThaiCategory.travel: return "ၵႂႃႇမႃး";
      case ThaiCategory.shopping: return "သိုဝ်ႉၶူဝ်း";
      case ThaiCategory.eating: return "ၵိၼ်ယႅမ်ႉ";
      case ThaiCategory.greeting: return "ၵႂၢမ်းတၵ်ႉတၢႆ";
    }
  }

  IconData get icon {
    switch (this) {
      case ThaiCategory.travel: return Icons.flight_takeoff;
      case ThaiCategory.shopping: return Icons.shopping_cart;
      case ThaiCategory.eating: return Icons.restaurant;
      case ThaiCategory.greeting: return Icons.front_hand;
    }
  }

  Color get color {
    switch (this) {
      case ThaiCategory.travel: return Colors.teal;
      case ThaiCategory.shopping: return Colors.orange;
      case ThaiCategory.eating: return Colors.redAccent;
      case ThaiCategory.greeting: return Colors.blue;
    }
  }
}

class ThaiPhrase {
  final ThaiCategory category; // Changed from String to Enum
  final String thai;
  final List<String> thaiSyllables;
  final String phonetic;
  final String shan;
  final String literalMeaning;

  ThaiPhrase({
    required this.category,
    required this.thai,
    required this.thaiSyllables,
    required this.phonetic,
    required this.shan,
    required this.literalMeaning,
  });
}
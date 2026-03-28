import 'package:flutter/material.dart';

/// Defines the three classes of Thai consonants which
/// determine the tone rules.
enum ThaiConsonantClass { high, mid, low }

class ThaiChar {
  final String thaiSymbol;      // The Thai character (e.g., "ก")
  final String shanSymbol;      // The Shan equivalent (e.g., "ၵ")
  final String phonetic;        // Romanized sound (e.g., "Ko Kai")
  final String shanExplanation;  // Description in Shan (e.g., "မိူၼ်တင်း တူဝ် ၵ")
  final ThaiConsonantClass charClass;

  ThaiChar({
    required this.thaiSymbol,
    required this.shanSymbol,
    required this.phonetic,
    required this.shanExplanation,
    required this.charClass,
  });

  /// Returns a specific color for the UI based on the Consonant Class.
  /// This helps learners visually categorize the letters.
  Color get classColor {
    switch (charClass) {
      case ThaiConsonantClass.mid:
        return Colors.green;  // Mid class: easy to learn
      case ThaiConsonantClass.high:
        return Colors.redAccent; // High class: unique tone rules
      case ThaiConsonantClass.low:
        return Colors.blueAccent; // Low class: most common
    }
  }
}
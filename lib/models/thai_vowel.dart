enum VowelPosition { top, bottom, front, back, around }

class ThaiVowel {
  final String symbol;         // e.g., "ะ"
  final String displaySymbol;  // e.g., "-ะ" (to show position)
  final String shanEquivalent; // e.g., "ႃ"
  final String phonetic;       // e.g., "Sra A"
  final String shanExplanation;
  final VowelPosition position;

  ThaiVowel({
    required this.symbol,
    required this.displaySymbol,
    required this.shanEquivalent,
    required this.phonetic,
    required this.shanExplanation,
    required this.position,
  });
}
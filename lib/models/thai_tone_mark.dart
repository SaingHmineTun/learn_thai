class ThaiToneMark {
  final String symbol;         // e.g., "◌ႇ" (Actually ◌ႇ in Thai is ◌ႇ)
  final String displaySymbol;  // e.g., "◌ႇ"
  final String name;           // e.g., "Mai Ek"
  final String shanEquivalent; // e.g., "ၸမ်ႈၼႃႈ"
  final String shanExplanation;

  ThaiToneMark({
    required this.symbol,
    required this.displaySymbol,
    required this.name,
    required this.shanEquivalent,
    required this.shanExplanation,
  });
}
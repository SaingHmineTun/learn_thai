import '../models/thai_tone_mark.dart';

final List<ThaiToneMark> thaiTones = [
  ThaiToneMark(
    symbol: "\u0E48", // Mai Ek
    displaySymbol: "-ႇ", // Thai dash + Thai Mai Ek
    name: "Mai Ek",
    shanEquivalent: "ၸမ်ႈၼႃႈ (ႇ)",
    shanExplanation: "သဵင်ဢၼ်လူင်း (Low Tone) - မိူၼ်ၸမ်ႈၼႃႈတႆး",
  ),
  ThaiToneMark(
    symbol: "\u0E49", // Mai Tho
    displaySymbol: "-ႆး", // Thai dash + Thai Mai Tho
    name: "Mai Tho",
    shanEquivalent: "ၸမ်ႈတႂ်ႈ (ႆး)",
    shanExplanation: "သဵင်ဢၼ်ၶိုၼ်ႈယဝ်ႉလူင်း (Falling Tone) - မိူၼ်ၸမ်ႈတႂ်ႈ",
  ),
  ThaiToneMark(
    symbol: "\u0E4A", // Mai Tri
    displaySymbol: "-း", // Thai dash + Thai Mai Tri
    name: "Mai Tri",
    shanEquivalent: "သဵင်ပွတ်း (း)",
    shanExplanation: "သဵင်သုင် (High Tone) - မိူၼ်သဵင်ပွတ်းတႆး",
  ),
  ThaiToneMark(
    symbol: "\u0E4B", // Mai Chattawa
    displaySymbol: "-ႆ", // Thai dash + Thai Mai Chattawa
    name: "Mai Chattawa",
    shanEquivalent: "ယႅတ်း (ႆ)",
    shanExplanation: "သဵင်ဢၼ်လူင်းယဝ်ႉၶိုၼ်ႈ (Rising Tone) - မိူၼ်ယႅတ်းတႆး",
  ),
];
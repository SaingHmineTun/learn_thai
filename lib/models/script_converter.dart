class ScriptConverter {
  // Shan to Thai Map (1-to-1 or 1-to-Many)
  static const Map<String, String> _shanToThai = {
    'ၵ': 'ก', 'ၶ': 'ข', 'င': 'ง', 'ၸ': 'จ', 'သ': 'ส',
    'ၺ': 'ญ', 'တ': 'ต', 'ထ': 'ถ', 'ၼ': 'น', 'ပ': 'ป',
    'ၽ': 'ผ', 'ၾ': 'ฝ', 'မ': 'ม', 'ယ': 'ย', 'ရ': 'ร',
    'လ': 'ล', 'ဝ': 'ว', 'ႁ': 'ห', 'ဢ': 'อ',
    'ႃ': 'า', 'ိ': 'ิ', 'ီ': 'ี', 'ု': 'ุ', 'ူ': 'ู',
    'ႇ': '\u0E48', 'ႆး': '\u0E49', 'း': '\u0E4A', 'ႆ': '\u0E4B',
    'ႉ': 'ะ',
  };

  // Thai to Shan Map (Many-to-1)
  static const Map<String, String> _thaiToShan = {
    // Consonants (Handling the 44)
    'ก': 'ၵ', 'ข': 'ၶ', 'ฃ': 'ၶ', 'ค': 'ၶ', 'ฅ': 'ၶ', 'ฆ': 'ၶ',
    'ง': 'င', 'จ': 'ၸ', 'ฉ': 'သ', 'ช': 'ၸ', 'ซ': 'သ', 'ฌ': 'ၸ',
    'ญ': 'ၺ', 'ฎ': 'တ', 'ฏ': 'တ', 'ฐ': 'ထ', 'ฑ': 'ထ', 'ฒ': 'ထ',
    'ณ': 'ၼ', 'ด': 'တ', 'ต': 'တ', 'ถ': 'ထ', 'ท': 'ထ', 'ธ': 'ထ',
    'น': 'ၼ', 'บ': 'ပ', 'ป': 'ပ', 'ผ': 'ၽ', 'ฝ': 'ၾ', 'พ': 'ၽ',
    'ฟ': 'ၾ', 'ภ': 'ၽ', 'ม': 'မ', 'ย': 'ယ', 'ร': 'ရ', 'ล': 'လ',
    'ว': 'ဝ', 'ศ': 'သ', 'ษ': 'သ', 'ส': 'သ', 'ห': 'ႁ', 'ฬ': 'လ',
    'อ': 'ဢ', 'ฮ': 'ႁ',
    // Vowels & Tones
    'า': 'ႃ', 'ิ': 'ိ', 'ี': 'ီ', 'ุ': 'ု', 'ူ': 'ူ', 'ะ': 'ႉ',
    '\u0E48': 'ႇ', '\u0E49': 'ႆး', '\u0E4A': 'း', '\u0E4B': 'ႆ',
  };

  static String shanToThai(String input) {
    if (input.isEmpty) return "";
    String res = input;
    // Reorder Front Vowels (Shan to Thai: Move to Front)
    res = res.replaceAllMapped(RegExp(r'([ၵ-ႁဢ])([ႂ]?)(ေ)'), (m) => 'เ${_shanToThai[m[1]]}${_shanToThai[m[2]] ?? ""}');
    res = res.replaceAllMapped(RegExp(r'([ၵ-ႁဢ])([ႂ]?)(ႅ)'), (m) => 'แ${_shanToThai[m[1]]}${_shanToThai[m[2]] ?? ""}');
    res = res.replaceAllMapped(RegExp(r'([ၵ-ႁဢ])([ႂ]?)(ူဝ်)'), (m) => 'โ${_shanToThai[m[1]]}${_shanToThai[m[2]] ?? ""}');

    _shanToThai.forEach((k, v) {
      if (!['ေ', 'ႅ', 'ူဝ်'].contains(k)) res = res.replaceAll(k, v);
    });
    return res;
  }

  static String thaiToShan(String input) {
    if (input.isEmpty) return "";
    String res = input;

    // Reorder Front Vowels (Thai to Shan: Move to Back)
    // Regex: Match (เ, แ, โ) followed by a Consonant, then swap them
    res = res.replaceAllMapped(RegExp(r'([เแโ])([ก-ฮ])'), (m) {
      String v = m[1] == 'เ' ? 'ေ' : (m[1] == 'แ' ? 'ႅ' : 'ူဝ်');
      return '${_thaiToShan[m[2]]}$v';
    });

    _thaiToShan.forEach((k, v) {
      res = res.replaceAll(k, v);
    });
    return res;
  }
}
import '../models/thai_vowel.dart';

// --- 1. SIMPLE VOWELS (18 sounds: 9 Short/Long Pairs) ---
final List<ThaiVowel> simpleVowels = [
  ThaiVowel(symbol: "ะ", displaySymbol: "-ะ", shanEquivalent: "ႉ", phonetic: "Sra A", shanExplanation: "သဵင် ဢႃႉ (ပုတ်း) - ဝၢႆးတူဝ်လိၵ်ႈ", position: VowelPosition.back),
  ThaiVowel(symbol: "า", displaySymbol: "-า", shanEquivalent: "ႃ", phonetic: "Sra Aa", shanExplanation: "သဵင် ဢႃ (ယၢဝ်း) - ဝၢႆးတူဝ်လိၵ်ႈ", position: VowelPosition.back),
  ThaiVowel(symbol: "ิ", displaySymbol: "-ิ", shanEquivalent: "ိ", phonetic: "Sra I", shanExplanation: "သဵင် ဢိ (ပုတ်း) - ၼိူဝ်တူဝ်လိၵ်ႈ", position: VowelPosition.top),
  ThaiVowel(symbol: "ီ", displaySymbol: "-ီ", shanEquivalent: "ီ", phonetic: "Sra Ii", shanExplanation: "သဵင် ဢီ (ယၢဝ်း) - ၼိူဝ်တူဝ်လိၵ်ႈ", position: VowelPosition.top),
  ThaiVowel(symbol: "ึ", displaySymbol: "-ึ", shanEquivalent: "ို", phonetic: "Sra Ue", shanExplanation: "သဵင် ဢိုဝ်ႉ (ပုတ်း) - ၼိူဝ်တူဝ်လိၵ်ႈ", position: VowelPosition.top),
  ThaiVowel(symbol: "ื", displaySymbol: "-ื", shanEquivalent: "ိုဝ်", phonetic: "Sra Uee", shanExplanation: "သဵင် ဢိုဝ် (ယၢဝ်း) - ၼိူဝ်တူဝ်လိၵ်ႈ", position: VowelPosition.top),
  ThaiVowel(symbol: "ု", displaySymbol: "-ု", shanEquivalent: "ု", phonetic: "Sra U", shanExplanation: "သဵင် ဢု (ပုတ်း) - တႂ်ႈတူဝ်လိၵ်ႈ", position: VowelPosition.bottom),
  ThaiVowel(symbol: "ူ", displaySymbol: "-ူ", shanEquivalent: "ူ", phonetic: "Sra Uu", shanExplanation: "သဵင် ဢူ (ယၢဝ်း) - တႂ်ႈတူဝ်လိၵ်ႈ", position: VowelPosition.bottom),
  ThaiVowel(symbol: "เ-ะ", displaySymbol: "เ-ะ", shanEquivalent: "ေႉ", phonetic: "Sra E (Short)", shanExplanation: "သဵင် ဢေႉ (ပုတ်း) - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "เ", displaySymbol: "เ-", shanEquivalent: "ေ", phonetic: "Sra E", shanExplanation: "သဵင် ဢေ (ယၢဝ်း) - ၼႃႈတူဝ်လိၵ်ႈ", position: VowelPosition.front),
  ThaiVowel(symbol: "แ-ะ", displaySymbol: "แ-ะ", shanEquivalent: "ႅႉ", phonetic: "Sra Ae (Short)", shanExplanation: "သဵင် ဢႄႉ (ပုတ်း) - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "แ", displaySymbol: "แ-", shanEquivalent: "ႅ", phonetic: "Sra Ae", shanExplanation: "သဵင် ဢႄ (ယၢဝ်း) - ၼႃႈတူဝ်လိၵ်ႈ", position: VowelPosition.front),
  ThaiVowel(symbol: "โ-ะ", displaySymbol: "โ-ะ", shanEquivalent: "ူဝ်ႉ", phonetic: "Sra O (Short)", shanExplanation: "သဵင် ဢူဝ်ႉ (ပုတ်း) - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "โ", displaySymbol: "โ-", shanEquivalent: "ူဝ်", phonetic: "Sra O", shanExplanation: "သဵင် ဢူဝ် (ယၢဝ်း) - ၼႃႈတူဝ်လိၵ်ႈ", position: VowelPosition.front),
  ThaiVowel(symbol: "เ-าะ", displaySymbol: "เ-าะ", shanEquivalent: "ေႃႉ", phonetic: "Sra Aw (Short)", shanExplanation: "သဵင် ဢေႃႉ (ပုတ်း) - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "อ", displaySymbol: "-อ", shanEquivalent: "ေႃ", phonetic: "Sra Aw", shanExplanation: "သဵင် ဢေႃ (ယၢဝ်း) - ဝၢႆးတူဝ်လိၵ်ႈ", position: VowelPosition.back),
  ThaiVowel(symbol: "เ-อะ", displaySymbol: "เ-อะ", shanEquivalent: "ေူဝ်ႉ", phonetic: "Sra Oe (Short)", shanExplanation: "သဵင် ဢိူဝ်ႉ (ပုတ်း) - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "เ-อ", displaySymbol: "เ-อ", shanEquivalent: "ေူဝ်", phonetic: "Sra Oe", shanExplanation: "သဵင် ဢိူဝ် (ယၢဝ်း) - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
];

// --- 2. DIPHTHONGS (Combined Sounds) ---
final List<ThaiVowel> diphthongs = [
  ThaiVowel(symbol: "เ-ียะ", displaySymbol: "เ-ียะ", shanEquivalent: "ဵႉ", phonetic: "Sra Ia (Short)", shanExplanation: "သဵင် ဢီႇယႃႉ - ၼႃႈ/ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "เ-ီယ", displaySymbol: "เ-ีย", shanEquivalent: "ဵ", phonetic: "Sra Ia", shanExplanation: "သဵင် ဢီႇယႃ - ၼႃႈ/ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "เ-ือะ", displaySymbol: "เ-ือะ", shanEquivalent: "ိူဝ်ႉ", phonetic: "Sra Uea (Short)", shanExplanation: "သဵင် ဢိုဝ်ႇယႃႉ - ၼႃႈ/ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "เ-ือ", displaySymbol: "เ-ือ", shanEquivalent: "ိူဝ်", phonetic: "Sra Uea", shanExplanation: "သဵင် ဢိုဝ်ႇယႃ - ၼႃႈ/ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "ัวะ", displaySymbol: "-ัวะ", shanEquivalent: "ူဝ်ႉ", phonetic: "Sra Ua (Short)", shanExplanation: "သဵင် ဢူဝ်ႇယႃႉ - ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "ัว", displaySymbol: "-ัว", shanEquivalent: "ူဝ်", phonetic: "Sra Ua", shanExplanation: "သဵင် ဢူဝ်ႇယႃ - ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
];

// --- 3. SPECIAL VOWELS (Vowels with final sounds built-in) ---
final List<ThaiVowel> specialVowels = [
  ThaiVowel(symbol: "ำ", displaySymbol: "-ำ", shanEquivalent: "မ်", phonetic: "Sra Am", shanExplanation: "သဵင် ဢမ် - ၼိူဝ်/ဝၢႆး", position: VowelPosition.around),
  ThaiVowel(symbol: "ใ", displaySymbol: "ใ-", shanEquivalent: "ႆ", phonetic: "Sra Ai Mai-Muan", shanExplanation: "သဵင် ဢႆ - ၼႃႈတူဝ်လိၵ်ႈ", position: VowelPosition.front),
  ThaiVowel(symbol: "ไ", displaySymbol: "ไ-", shanEquivalent: "ႆ", phonetic: "Sra Ai Mai-Malay", shanExplanation: "သဵင် ဢႆ - ၼႃႈတူဝ်လိၵ်ႈ", position: VowelPosition.front),
  ThaiVowel(symbol: "เ-า", displaySymbol: "เ-า", shanEquivalent: "ဝ်", phonetic: "Sra Ao", shanExplanation: "သဵင် ဢဝ် - ၼႃႈ/ဝၢႆး", position: VowelPosition.around),
];
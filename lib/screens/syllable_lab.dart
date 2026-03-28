import 'package:flutter/material.dart';
import 'dart:ui';

class SyllableLabScreen extends StatefulWidget {
  const SyllableLabScreen({super.key});

  @override
  State<SyllableLabScreen> createState() => _SyllableLabScreenState();
}

class _SyllableLabScreenState extends State<SyllableLabScreen> {
  // 1. DATA BANK: Initials with Tone Classes (ၵုမ်ႇမႄႈလိၵ်ႈ)
  final List<Map<String, String>> _initials = [
    {'t': 'ก', 's': 'ၵ', 'class': 'Mid'}, {'t': 'จ', 's': 'ၸ', 'class': 'Mid'},
    {'t': 'ข', 's': 'ၶ', 'class': 'High'}, {'t': 'ส', 's': 'သ', 'class': 'High'},
    {'t': 'ห', 's': 'ႁ', 'class': 'High'}, {'t': 'ค', 's': 'ၶ', 'class': 'Low'},
    {'t': 'ง', 's': 'င', 'class': 'Low'}, {'t': 'น', 's': 'ၼ', 'class': 'Low'},
    {'t': 'ม', 's': 'မ', 'class': 'Low'}, {'t': 'ย', 's': 'ယ', 'class': 'Low'},
    {'t': 'ร', 's': 'ရ', 'class': 'Low'}, {'t': 'ล', 's': 'လ', 'class': 'Low'},
    {'t': 'ว', 's': 'ဝ', 'class': 'Low'},
  ];

  // 2. DATA BANK: Vowels (သရႃႉ)
  final List<Map<String, dynamic>> _vowels = [
    {'t': 'า', 's': 'ဢႃ', 'pos': 'after'},
    {'t': 'ี', 's': 'ဢီ', 'pos': 'top'},
    {'t': 'ู', 's': 'ဢူ', 'pos': 'bottom'},
    {'t': 'เ', 's': 'ဢေ', 'pos': 'front'},
    {'t': 'แ', 's': 'ဢႄ', 'pos': 'front'},
    {'t': 'ะ', 's': 'ဢႃႉ', 'pos': 'after_jump'},
  ];

  // 3. DATA BANK: Finals (တူဝ်သတ်း)
  final List<Map<String, String>> _finals = [
    {'t': '', 's': ''},
    {'t': 'ง', 's': 'င'}, {'t': 'น', 's': 'ၼ'}, {'t': 'ม', 's': 'မ'},
    {'t': 'ก', 's': 'ၵ'}, {'t': 'ด', 's': 'တ'}, {'t': 'บ', 's': 'ပ'},
  ];

  // 4. DATA BANK: Tone Marks (သဵင်ဝၼ်းၼႃး)
  final List<Map<String, String>> _tones = [
    {'t': '', 's': '(ပဵင်း)', 'n': 'Common'},
    {'t': '\u0E48', 's': 'ႇ', 'n': 'Mai Ek'},
    {'t': '\u0E49', 's': 'ႉ', 'n': 'Mai Tho'},
    {'t': '\u0E4A', 's': 'း', 'n': 'Mai Tri'},
    {'t': '\u0E4B', 's': 'ႆႇ', 'n': 'Mai Chattawa'},
  ];

  int _selectedInitial = 0;
  int _selectedVowel = 0;
  int _selectedFinal = 0;
  int _selectedTone = 0;

  String _compileThai() {
    String c = _initials[_selectedInitial]['t']!;
    String v = _vowels[_selectedVowel]['t']!;
    String f = _finals[_selectedFinal]['t']!;
    String t = _tones[_selectedTone]['t']!;
    String pos = _vowels[_selectedVowel]['pos']!;

    if (pos == 'after_jump' && f.isNotEmpty) return "$c$t\u0E31$f";
    if (pos == 'front') return "$v$c$t$f";
    if (pos == 'top' || pos == 'bottom') return "$c$v$t$f";
    return "$c$t$v$f";
  }

  String _compileShan() {
    String c = _initials[_selectedInitial]['s']!;
    String v = _vowels[_selectedVowel]['s']!.replaceAll('ဢ', '');
    String f = _finals[_selectedFinal]['s']!;
    String t = _tones[_selectedTone]['s'] == '(ပဵင်း)' ? '' : _tones[_selectedTone]['s']!;
    return "$c$v$f$t";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Tonal Lab"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo[900]!, Colors.indigo[800]!, Colors.blue[900]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- FROSTED GLASS OUTPUT ---
              _buildResultCard(),

              // --- TONE HINT BADGE ---
              _buildToneHint(),

              // --- 4-WHEEL SELECTOR ---
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildWheel("တူဝ်ငဝ်ႈ", _initials, (v) => setState(() => _selectedInitial = v)),
                      _buildWheel("သရႃႉ", _vowels, (v) => setState(() => _selectedVowel = v)),
                      _buildWheel("တူဝ်သတ်း", _finals, (v) => setState(() => _selectedFinal = v)),
                      _buildWheel("သဵင်", _tones, (v) => setState(() => _selectedTone = v)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  _compileThai(),
                  style: const TextStyle(fontFamily: 'thai', fontSize: 90, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Shan: ${_compileShan()}",
                      style: const TextStyle(fontFamily: 'shan', fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amberAccent)),
                  const SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
                    child: Text(_initials[_selectedInitial]['class']!,
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToneHint() {
    String cls = _initials[_selectedInitial]['class']!;
    String hint = cls == 'Mid' ? "Standard (သဵင်ပဵင်း)" : cls == 'High' ? "Rising (သဵင်ၶိုၼ်ႈ)" : "Shift! (သဵင်ပိၼ်ႈ)";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Text(
        "$cls Class: $hint",
        style: const TextStyle(fontFamily: 'shan', color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _buildWheel(String title, List<dynamic> data, Function(int) onChange) {
    String currentThaiInitial = _initials[_selectedInitial]['t']!;

    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 25),
          Text(title, style: const TextStyle(fontFamily: 'shan', fontWeight: FontWeight.bold, fontSize: 11, color: Colors.indigo)),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: onChange,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: data.length,
                builder: (context, index) {
                  String text = "";
                  if (title == "သရႃႉ") {
                    text = data[index]['pos'] == 'front' ? "${data[index]['t']}$currentThaiInitial" : "$currentThaiInitial${data[index]['t']}";
                  } else if (title == "သဵင်") {
                    text = "$currentThaiInitial${data[index]['t']}";
                  } else {
                    text = data[index]['t'];
                  }

                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(text, style: const TextStyle(fontFamily: 'thai', fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(data[index]['s'], style: const TextStyle(fontFamily: 'shan', fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:learn_thai/data/thai_phrases.dart';
import 'dart:math';
import '../models/thai_phrase.dart';

class SentenceBuilderScreen extends StatefulWidget {
  const SentenceBuilderScreen({super.key});

  @override
  _SentenceBuilderScreenState createState() => _SentenceBuilderScreenState();
}

class _SentenceBuilderScreenState extends State<SentenceBuilderScreen> {
  late ThaiPhrase _currentMission;
  List<String> _mySentence = [];
  List<String> _shuffledBank = [];
  int _score = 0;
  final Color _primaryColor = Colors.teal[700]!;

  @override
  void initState() {
    super.initState();
    _generateNewMission();
  }

  void _generateNewMission() {
    final filteredPhrases = allPhrases.where((p) =>
    p.thaiSyllables.length >= 3 && !p.thai.contains('?')
    ).toList();

    setState(() {
      _mySentence = [];
      _currentMission = filteredPhrases[Random().nextInt(filteredPhrases.length)];
      _shuffledBank = List<String>.from(_currentMission.thaiSyllables)..shuffle();
    });
  }

  void _checkSentence() {
    String myAnswer = _mySentence.join("");
    if (myAnswer == _currentMission.thai) {
      setState(() => _score++);
      _showSuccessDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Try again! (ၶိုၼ်းႁဵတ်းတူၺ်းမႂ်ႇၶႃႈ)", style: TextStyle(fontFamily: 'shan')),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: const Text("Correct! (ထုၵ်ႇမႅၼ်ႈ)", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'shan')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 15),
            Text(_currentMission.thai, style: const TextStyle(fontFamily: 'thai', fontSize: 28, fontWeight: FontWeight.bold)),
            Text(_currentMission.phonetic, style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic)),
            const Divider(height: 30),
            Text("Shan: ${_currentMission.shan}", style: const TextStyle(fontFamily: 'shan', fontSize: 18)),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _generateNewMission();
              },
              style: ElevatedButton.styleFrom(backgroundColor: _primaryColor, shape: StadiumBorder()),
              child: const Text("Next Mission"),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Score: $_score"),
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _generateNewMission),
        ],
      ),
      body: Column(
        children: [
          // 1. THE MISSION BOX (Glass Header)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: _primaryColor,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                const Text("MISSION: Translate to Thai", style: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: 1.2)),
                const SizedBox(height: 10),
                Text(
                  _currentMission.shan,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'shan', fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                if (_currentMission.literalMeaning.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Hint: ${_currentMission.literalMeaning}",
                        style: TextStyle(fontFamily: 'shan', fontSize: 13, color: Colors.white.withOpacity(0.6))),
                  ),
              ],
            ),
          ),

          // 2. THE WORKSPACE (The building area)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text("YOUR SENTENCE:", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 10),
                  Container(
                    height: 120,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: _mySentence.isEmpty ? Colors.grey[200]! : _primaryColor, width: 2),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _mySentence.asMap().entries.map((entry) {
                        return _buildSyllableChip(entry.value, true, () {
                          setState(() => _mySentence.removeAt(entry.key));
                        });
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // CHECK BUTTON
                  if (_mySentence.length == _currentMission.thaiSyllables.length)
                    ElevatedButton.icon(
                      onPressed: _checkSentence,
                      icon: const Icon(Icons.bolt),
                      label: const Text("CHECK ANSWER", style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),

                  const Spacer(),

                  // 3. THE WORD BANK (Glass blocks)
                  const Text("TAP TO ADD SYLLABLES", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: _shuffledBank.map((syllable) {
                        return _buildSyllableChip(syllable, false, () {
                          if (_mySentence.length < _currentMission.thaiSyllables.length) {
                            setState(() => _mySentence.add(syllable));
                          }
                        });
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyllableChip(String text, bool isInWorkspace, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isInWorkspace ? _primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: _primaryColor.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'thai',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isInWorkspace ? Colors.white : _primaryColor,
          ),
        ),
      ),
    );
  }
}
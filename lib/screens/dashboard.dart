import 'dart:math';
import 'package:flutter/material.dart';
import 'package:learn_thai/data/cognate_words.dart';
import 'package:learn_thai/screens/about_screen.dart';
import 'package:learn_thai/screens/phrase_category_screen.dart';
import 'package:learn_thai/screens/script_converter.dart';
import 'package:learn_thai/screens/sentence_builder.dart';
import 'package:learn_thai/screens/syllable_lab.dart';
import 'package:learn_thai/screens/tone_mark_grid.dart';
import 'package:learn_thai/screens/vowel_grid.dart';
import '../models/cognate_word.dart';
import '../models/menu_item.dart';
import 'alpha_grid.dart';
import 'cognate_dictionary.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<DashboardItem> menuItems = [
    DashboardItem(
      title: "Consonants",
      shanTitle: "တူဝ်မႄႈလိၵ်ႈ",
      icon: Icons.sort_by_alpha,
      color: const Color(0xFF448AFF),
      targetScreen: const AlphabetGrid(),
    ),
    DashboardItem(
      title: "Vowels",
      shanTitle: "သရႃႉ",
      icon: Icons.auto_awesome,
      color: const Color(0xFFFF9800),
      targetScreen: const VowelGrid(),
    ),
    DashboardItem(
      title: "Tone Rules",
      shanTitle: "တူၼ်းသဵင်",
      icon: Icons.graphic_eq,
      color: const Color(0xFF4CAF50),
      targetScreen: ToneMarkGrid(),
    ),
    DashboardItem(
      title: "Common Words",
      shanTitle: "ၵႂၢမ်းၵႆႉၸႂ်ႉ",
      icon: Icons.forum_outlined,
      color: const Color(0xFFE91E63),
      targetScreen: CategorySelectionScreen(),
    ),
    DashboardItem(
      title: "Converter",
      shanTitle: "ပိၼ်ႇလိၵ်ႈ",
      icon: Icons.sync,
      color: const Color(0xFF3F51B5),
      targetScreen: ConverterScreen(),
    ),
    DashboardItem(
      title: "Twin Words",
      shanTitle: "ၵႂၢမ်းမိူၼ်ၵၼ်",
      icon: Icons.people_outline,
      color: const Color(0xFFFF5722),
      targetScreen: CognateDictionaryScreen(),
    ),
    DashboardItem(
      title: "Sentence Builder",
      shanTitle: "ၶူင်သၢင်ႈၶေႃႈၵႂၢမ်း",
      icon: Icons.architecture,
      color: const Color(0xFFF44336),
      targetScreen: SentenceBuilderScreen(),
    ),
    DashboardItem(
      title: "Syllable Lab",
      shanTitle: "တူဝ်လိၵ်ႈထႆး",
      icon: Icons.science_outlined,
      color: const Color(0xFF673AB7),
      targetScreen: const SyllableLabScreen(),
    ),
  ];

  Cognate getDailyWord() {
    final random = Random();
    return cognateList[random.nextInt(cognateList.length)];
  }

  @override
  Widget build(BuildContext context) {
    final dailyWord = getDailyWord();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo[900]!,
              Colors.indigo[700]!,
              Colors.blue[900]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildDailyWordCard(dailyWord),
              Expanded(child: _buildMenuGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "မႂ်ႇသုင်ၶႃႈ!",
                style: TextStyle(
                  fontFamily: 'shan',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Welcome to Learn Thai",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => AboutScreen()));
            },
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyWordCard(Cognate word) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.lightbulb_outline,
                color: Colors.amber,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "DAILY TWIN WORD (ၵႂၢမ်းမိူၼ်ၵၼ်)",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 12,
                  fontFamily: "shan",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _wordColumn(word.shan, "Shan", 'shan'),
              Icon(Icons.compare_arrows, color: Colors.white.withOpacity(0.5)),
              _wordColumn(word.thai, "Thai", 'thai'),
            ],
          ),
          const Divider(color: Colors.white10, height: 25),
          Text(
            "Meaning: ${word.meaning}",
            style: const TextStyle(
              color: Colors.amberAccent,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _wordColumn(String word, String label, String font) {
    return Column(
      children: [
        Text(
          word,
          style: TextStyle(
            fontFamily: font,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildMenuGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.1,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuCard(context, item);
      },
    );
  }

  Widget _buildMenuCard(BuildContext context, DashboardItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => item.targetScreen),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(item.icon, size: 32, color: item.color),
              ),
              const SizedBox(height: 10),
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                item.shanTitle,
                style: const TextStyle(
                  fontFamily: 'shan',
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

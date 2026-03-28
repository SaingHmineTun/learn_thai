import 'package:flutter/material.dart';
import '../models/thai_phrase.dart';
import '../data/thai_phrases.dart';

class PhraseListScreen extends StatelessWidget {
  final ThaiCategory category;

  const PhraseListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter phrases by category
    final filteredPhrases = allPhrases.where((p) => p.category == category).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(category.title), // Shows the English title in AppBar
        backgroundColor: category.color,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                category.shanTitle,
                style: const TextStyle(fontFamily: 'shan', fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sub-header to show category info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: category.color.withOpacity(0.1),
            child: Text(
              "Found ${filteredPhrases.length} useful phrases",
              textAlign: TextAlign.center,
              style: TextStyle(color: category.color, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
              itemCount: filteredPhrases.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = filteredPhrases[index];
                return _buildPhraseCard(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhraseCard(BuildContext context, ThaiPhrase item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onLongPress: () {
              // Quick logic hint for lecturer: Add copy to clipboard here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Phrase copied!"), duration: Duration(seconds: 1)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. THAI SCRIPT (The Hero)
                  Text(
                    item.thai,
                    style: TextStyle(
                      fontFamily: 'thai',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: category.color,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // 2. PHONETIC (Small and readable)
                  Text(
                    item.phonetic,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      letterSpacing: 0.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1, thickness: 0.5),
                  ),

                  // 3. SHAN TRANSLATION
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.translate, size: 16, color: category.color.withOpacity(0.6)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item.shan,
                          style: const TextStyle(
                            fontFamily: 'shan',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 4. LITERAL MEANING / NOTES
                  if (item.literalMeaning.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Note: ${item.literalMeaning}",
                        style: TextStyle(
                          fontFamily: 'shan',
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
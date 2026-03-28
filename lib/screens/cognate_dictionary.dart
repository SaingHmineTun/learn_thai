import 'package:flutter/material.dart';
import '../data/cognate_words.dart';

class CognateDictionaryScreen extends StatefulWidget {
  const CognateDictionaryScreen({super.key});

  @override
  State<CognateDictionaryScreen> createState() => _CognateDictionaryScreenState();
}

class _CognateDictionaryScreenState extends State<CognateDictionaryScreen> {
  String _searchQuery = "";
  final Color _accentColor = Colors.orange[800]!;

  @override
  Widget build(BuildContext context) {
    // Search logic covers Meaning, Shan, and Thai for a better UX
    final filteredList = cognateList.where((c) {
      final query = _searchQuery.toLowerCase();
      return c.meaning.toLowerCase().contains(query) ||
          c.shan.contains(_searchQuery) ||
          c.thai.contains(_searchQuery);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Twin Words (ၵႂၢမ်းမိူၼ်ၵၼ်)"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_accentColor.withOpacity(0.9), Colors.grey[50]!],
            stops: const [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- SEARCH BAR (Modern Capsule) ---
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15)],
                  ),
                  child: TextField(
                    onChanged: (val) => setState(() => _searchQuery = val),
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: "Search meaning, Shan, or Thai...",
                      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                      prefixIcon: Icon(Icons.search_rounded, color: _accentColor),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),

              // --- RESULTS LIST ---
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    return _buildCognateCard(item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCognateCard(dynamic item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
        ],
        border: Border.all(color: Colors.orange.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          // 1. Meaning & Phonetic Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.meaning.toUpperCase(),
                  style: TextStyle(letterSpacing: 1.1, fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
                Text(
                  "[ ${item.phonetic} ]",
                  style: TextStyle(color: _accentColor.withOpacity(0.7), fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // 2. Dual-Language Comparison Area
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: [
                _buildLanguageSide("SHAN", item.shan, 'shan', Colors.black87),
                Icon(Icons.repeat_rounded, color: _accentColor.withOpacity(0.3), size: 20),
                _buildLanguageSide("THAI", item.thai, 'thai', Colors.indigo[700]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSide(String label, String word, String font, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey)),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              word,
              style: TextStyle(
                fontFamily: font,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
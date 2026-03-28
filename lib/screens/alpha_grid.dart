import 'package:flutter/material.dart';
import '../models/thai_char.dart';
import '../data/thai_data.dart';

class AlphabetGrid extends StatefulWidget {
  const AlphabetGrid({super.key});

  @override
  _AlphabetGridState createState() => _AlphabetGridState();
}

class _AlphabetGridState extends State<AlphabetGrid> {
  int _selectedIndex = 0;

  List<ThaiChar> get _currentList {
    switch (_selectedIndex) {
      case 0: return midClassConsonants;
      case 1: return highClassConsonants;
      case 2: return lowClassConsonants;
      default: return midClassConsonants;
    }
  }

  Color get _activeColor {
    switch (_selectedIndex) {
      case 0: return Colors.teal[600]!;
      case 1: return Colors.redAccent[700]!;
      case 2: return Colors.indigo[700]!;
      default: return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Mid Class (ၵၢင်)" :
        _selectedIndex == 1 ? "High Class (သုင်)" : "Low Class (တႅမ်ႇ)"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_activeColor.withOpacity(0.8), Colors.white],
            stops: const [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildModernHeader(),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: _currentList.length,
                  itemBuilder: (context, index) => _buildAlphabetTile(_currentList[index]),
                ),
              ),
              const SizedBox(height: 80), // Padding for the floating nav
            ],
          ),
        ),
      ),
      bottomSheet: _buildFloatingNav(),
    );
  }

  Widget _buildAlphabetTile(ThaiChar item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: _activeColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))
        ],
        border: Border.all(color: _activeColor.withOpacity(0.1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 1. DYNAMICALLY SCALED THAI CHARACTER
            Expanded(
              flex: 4,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    item.thaiSymbol,
                    style: TextStyle(
                      fontFamily: 'thai', // Use Thai Font
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: _activeColor,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 2. SHAN TRANSLATION BADGE
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _activeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                item.shanSymbol,
                style: TextStyle(
                  fontFamily: 'shan', // Use Shan Font
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _activeColor,
                ),
              ),
            ),

            const SizedBox(height: 6),

            // 3. SHAN EXPLANATION (Ellipsis for safety)
            Text(
              item.shanExplanation,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'shan', // Use Shan Font
                fontSize: 11,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: _activeColor,
              child: Text("${_currentList.length}", style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Thai Consonants", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("တူဝ်မႄႈလိၵ်ႈထႆး", style: TextStyle(fontFamily: 'shan', fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingNav() {
    return Container(
      height: 90,
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: _activeColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Mid"),
            BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "High"),
            BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Low"),
          ],
        ),
      ),
    );
  }
}
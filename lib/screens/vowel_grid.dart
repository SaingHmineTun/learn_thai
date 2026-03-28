import 'package:flutter/material.dart';
import '../models/thai_vowel.dart';
import '../data/thai_vowels.dart';

class VowelGrid extends StatefulWidget {
  const VowelGrid({super.key});

  @override
  State<VowelGrid> createState() => _VowelGridState();
}

class _VowelGridState extends State<VowelGrid> {
  int _selectedIndex = 0;

  List<ThaiVowel> get _currentVowelList {
    switch (_selectedIndex) {
      case 0: return simpleVowels;
      case 1: return diphthongs;
      case 2: return specialVowels;
      default: return simpleVowels;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Thai Vowels - သရႃႉထႆး"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange[700]!.withOpacity(0.8), Colors.white],
            stops: const [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          // Use a Column but make the Grid Expanded to prevent vertical fighting
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85, // Adjusted for better height
                  ),
                  itemCount: _currentVowelList.length,
                  itemBuilder: (context, index) => _buildVowelTile(_currentVowelList[index]),
                ),
              ),
              const SizedBox(height: 100), // Space for the floating Nav
            ],
          ),
        ),
      ),
      bottomSheet: _buildFloatingNav(), // Using bottomSheet to keep it above the grid
      backgroundColor: Colors.white,
    );
  }

  Widget _buildVowelTile(ThaiVowel item) {
    // FIX: Using Thai "อ" as the standard anchor
    String display = item.displaySymbol.replaceAll("-", "ก");

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        border: Border.all(color: Colors.orange.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FittedBox prevents the "Bottom Overflow" for the large Thai symbol
            Expanded(
              flex: 3,
              child: Text(
                display,
                style: const TextStyle(fontFamily: 'thai', fontSize: 60, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Shan: ${item.shanEquivalent}",
              style: const TextStyle(fontFamily: 'shan', fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            // MaxLines and Ellipsis prevent overflow for long explanations
            Text(
              item.shanExplanation,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: 'shan', fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          _selectedIndex == 0 ? "သရႃႉလဵဝ် (Simple)" : _selectedIndex == 1 ? "သရႃႉၶူပ်း (Diphthongs)" : "သရႃႉလိုၵ်ႉ (Special)",
          style: const TextStyle(fontFamily: 'shan', fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFloatingNav() {
    return Container(
      height: 80,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20)],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: Colors.deepOrange,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Simple"),
            BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Diph"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Special"),
          ],
        ),
      ),
    );
  }
}
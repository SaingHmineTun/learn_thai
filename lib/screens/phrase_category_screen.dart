import 'package:flutter/material.dart';
import '../models/thai_phrase.dart';
import 'phrase_list_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allCategories = ThaiCategory.values;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Categories - လွၵ်းၵႂၢမ်း"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo[900]!, Colors.indigo[600]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
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
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: allCategories.length,
                    itemBuilder: (context, index) {
                      final ThaiCategory cat = allCategories[index];
                      return _buildCategoryCard(context, cat);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phrase Library",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "လိူၵ်ႈလွၵ်းၵႂၢမ်းဢၼ်ၶႂ်ႈႁဵၼ်း",
            style: TextStyle(fontFamily: 'shan', color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, ThaiCategory cat) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: cat.color.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhraseListScreen(category: cat)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Glowing Icon Background
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: cat.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(cat.icon, size: 38, color: cat.color),
              ),
              const SizedBox(height: 12),
              Text(
                cat.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                cat.shanTitle,
                style: const TextStyle(
                  fontFamily: 'shan',
                  color: Colors.blueGrey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
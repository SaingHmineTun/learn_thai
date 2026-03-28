import 'package:flutter/material.dart';
import '../data/thai_tone_marks.dart';

class ToneMarkGrid extends StatelessWidget {
  const ToneMarkGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the primary accent color for this screen
    final Color accentColor = Colors.pinkAccent[400]!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Tone Marks - တူၼ်းသဵင်"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [accentColor.withOpacity(0.8), Colors.white],
            stops: const [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildModernHeader(accentColor),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: thaiTones.length,
                  itemBuilder: (context, index) {
                    final item = thaiTones[index];
                    return _buildToneTile(item, accentColor);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToneTile(dynamic item, Color accentColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
        border: Border.all(color: accentColor.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 1. DYNAMICALLY SCALED TONE SYMBOL
            Expanded(
              flex: 4,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0), // Space for tone mark height
                    child: Text(
                      "ก${item.symbol}",
                      style: TextStyle(
                        fontFamily: 'thai', // Use Thai Font
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 2. TONE NAME & SHAN EQUIVALENT
            Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Shan: ${item.shanEquivalent}",
                style: TextStyle(
                  fontFamily: 'shan', // Use Shan Font
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 3. SHAN EXPLANATION
            Text(
              item.shanExplanation,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'shan', // Use Shan Font
                fontSize: 10,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernHeader(Color accentColor) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        ),
        child: Column(
          children: [
            const Text(
              "Thai Tone Marks (4 မၢႆ / 5 သဵင်)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 6),
            const Text(
              "မၢႆသဵင်ထႆးမီး 4 မၢႆ၊ ၵူၺ်းၵႃႈ ဢွၵ်ႇသဵင်လႆႈ 5 သဵင်",
              style: TextStyle(fontFamily: 'shan', fontSize: 12, color: Colors.grey),
            ),
            const Divider(height: 20),
            Text(
              "သဵင်ပဵင်း (Mid Tone) ဢမ်ႇမီးမၢႆသႂ်ႉ",
              style: TextStyle(fontFamily: 'shan', fontSize: 12, color: accentColor, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
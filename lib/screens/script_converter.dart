import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/script_converter.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  bool _isShanToThai = true;

  void _handleConversion(String text) {
    setState(() {
      _result = _isShanToThai
          ? ScriptConverter.shanToThai(text)
          : ScriptConverter.thaiToShan(text);
    });
  }

  void _toggleDirection() {
    setState(() {
      _isShanToThai = !_isShanToThai;
      _controller.clear();
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Colors.indigoAccent[700]!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Script Converter"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              _controller.clear();
              setState(() => _result = "");
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [themeColor, Colors.white],
            stops: const [0.0, 0.45],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // --- DIRECTION TOGGLE (Modern Badge Style) ---
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLangLabel(_isShanToThai ? "Shan" : "Thai", true),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton.filled(
                          onPressed: _toggleDirection,
                          icon: const Icon(Icons.swap_horiz_rounded),
                          style: IconButton.styleFrom(backgroundColor: Colors.white),
                          color: themeColor,
                        ),
                      ),
                      _buildLangLabel(_isShanToThai ? "Thai" : "Shan", false),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // --- INPUT BOX ---
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15)],
                  ),
                  child: TextField(
                    controller: _controller,
                    onChanged: _handleConversion,
                    maxLines: 4,
                    style: TextStyle(
                      fontFamily: _isShanToThai ? 'shan' : 'thai', // Map to correct font
                      fontSize: 20,
                      height: 1.4,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: _isShanToThai ? "တႅမ်ႈလိၵ်ႈတႆးတီႈၼႆႈ..." : "พิมพ์ภาษาไทยที่นี่...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(Icons.keyboard_double_arrow_down_rounded, color: Colors.indigoAccent, size: 30),
                ),

                // --- RESULT BOX (Glassmorphism inspired) ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: themeColor.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(color: themeColor.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("RESULT", style: TextStyle(letterSpacing: 1.2, fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                          IconButton.outlined(
                            icon: const Icon(Icons.copy_rounded, size: 20),
                            onPressed: () {
                              if (_result.isNotEmpty) {
                                Clipboard.setData(ClipboardData(text: _result));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Copied to clipboard!")),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Text(
                        _result.isEmpty ? "..." : _result,
                        style: TextStyle(
                          fontFamily: _isShanToThai ? 'thai' : 'shan', // Output font mapping
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLangLabel(String text, bool isSource) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
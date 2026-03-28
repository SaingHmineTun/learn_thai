// Update your main.dart with this theme

import 'package:flutter/material.dart';
import 'package:learn_thai/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Thai-Shan',
      theme: ThemeData(
        useMaterial3: true,
        // --- COLORS ---
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E), // Deep Indigo
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFFFFA000), // Amber Gold
          surface: Colors.white,
          background: const Color(0xFFF8F9FA), // Subtle Off-white
        ),

        // --- TYPOGRAPHY ---
        // Replace 'ThaiFont' and 'ShanFont' with your actual family names
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Thai',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E)
          ),
          bodyLarge: TextStyle(
              fontFamily: 'Shan',
              fontSize: 18,
              color: Colors.black87
          ),
          labelLarge: TextStyle(
              fontFamily: 'Shan',
              fontWeight: FontWeight.w600
          ),
        ),

        // --- COMPONENT STYLES ---
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'Shan',
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A237E),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            textStyle: const TextStyle(fontFamily: 'ShanFont', fontWeight: FontWeight.bold),
          ),
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(8),
        ),
      ),
      home: DashboardScreen(),
    );
  }
}
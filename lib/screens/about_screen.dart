import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl(String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);

      // Check if the OS can actually handle this specific URI
      bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint("Could not launch $urlString");
        // Fallback: Try a less restrictive mode if external fails
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
      // Show a user-friendly message so the app doesn't just "do nothing"
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo[900]!, Colors.indigo[700]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),

              // --- APP LOGO ---
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Learn Thai (လိၵ်ႈထႆး)",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "shan"),
              ),
              const Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.white70, fontSize: 14, fontFamily: "shan"),
              ),

              const SizedBox(height: 30),

              // --- CONTACT CARDS ---
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 30),
                    children: [
                      _buildAboutCard(
                        icon: Icons.email_outlined,
                        title: "Email Us",
                        subtitle: "tmk.muse@gmail.com",
                        color: Colors.redAccent,
                        onTap: () => _launchUrl("mailto:tmk.muse@gmail.com"),
                      ),
                      _buildAboutCard(
                        icon: Icons.facebook_outlined,
                        title: "Facebook Page",
                        subtitle: "Thung Mao Kham",
                        color: Colors.blue[800]!,
                        onTap: () => _launchUrl("https://www.facebook.com/profile.php?id=61569069823862"),
                      ),
                      _buildAboutCard(
                        icon: Icons.code_rounded,
                        title: "GitHub",
                        subtitle: "View Source Code",
                        color: Colors.grey[800]!,
                        onTap: () => _launchUrl("https://github.com/SaingHmineTun/learn_thai"),
                      ),
                      _buildAboutCard(
                        icon: Icons.language_rounded,
                        title: "Official Website",
                        subtitle: "www.saimao.top",
                        color: Colors.indigoAccent,
                        onTap: () => _launchUrl("https://www.saimao.top"),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "Made with ❤️ for the Shan Community",
                          style: TextStyle(fontFamily: 'shan', color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const Text("About App", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "shan", fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAboutCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "shan")),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13, fontFamily: "shan")),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      ),
    );
  }
}
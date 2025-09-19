import 'package:flutter/material.dart';

class EmotionsMountainsPage extends StatelessWidget {
  const EmotionsMountainsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = [
      {
        "text": "In the silence of the mountains, peace is reborn.",
        "icon": Icons.self_improvement
      },
      {
        "text": "Every climb awakens courage, every peak inspires strength.",
        "icon": Icons.terrain
      },
      {
        "text": "From valleys of stillness to summits of wonder.",
        "icon": Icons.star
      },
      {
        "text": "The mountains teach us resilience, patience, and beauty.",
        "icon": Icons.favorite
      },
      {
        "text": "Breathe deep, climb high, and feel alive.",
        "icon": Icons.landscape
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFFffffff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Emotions: Mountain's Inspiration",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      final quote = quotes[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              quote["icon"] as IconData,
                              color: Colors.teal,
                              size: 30,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                quote["text"] as String,
                                style: const TextStyle(
                                  fontSize: 17,
                                  height: 1.5,
                                  color: Colors.black87,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

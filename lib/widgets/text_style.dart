import 'package:flutter/material.dart';

class TextList extends StatelessWidget {
  const TextList({super.key, required List texts});

  @override
  Widget build(BuildContext context) {
    final List<String> texts = [
      "1- Discover the mountains, where every journey becomes a story of inspiration.",
      "2- From hidden trails to soaring peaks, let the mountains awaken your spirit.",
      "3- Travel beyond the ordinary—find inspiration in every mountain horizon.",
      "4- Where challenge meets beauty, and every step leads to discovery.",
      "5- Breathe deeper, climb higher, and uncover the inspiration of the mountains.",
      "6-Your adventure starts here—in the timeless inspiration of the mountains.",
      "7- Discover mountains not just as destinations, but as journeys of the soul.",
    ];

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        children: [
          const Text(
            "🌍✨Discover Mountain’s Inspiration:",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...texts.map(
            (text) => Container(
              margin: const EdgeInsets.only(left: 8, right: 18, bottom: 16),
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                    offset: const Offset(1, 1),
                  )
                ],
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

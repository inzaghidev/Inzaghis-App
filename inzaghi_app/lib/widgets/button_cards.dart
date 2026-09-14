import 'dart:math' as math;

import 'package:flutter/material.dart';

class ButtonCards extends StatelessWidget {
  const ButtonCards({Key? key}) : super(key: key);

  Widget buildCardWithImagesIcon(
      BuildContext context, dynamic imageOrIcon, String title, String route) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = math.min(126.0, (screenWidth - 92) / 3);

    return Card(
      margin: const EdgeInsets.all(2),
      elevation: 2,
      color: Colors.lightBlue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: SizedBox(
            width: cardWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imageOrIcon is IconData)
                    Icon(imageOrIcon)
                  else if (imageOrIcon is String)
                    Image.asset(
                      imageOrIcon,
                      width: 24,
                      height: 24,
                    ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String label, String route) {
    return ElevatedButton(
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty container as this widget is meant to provide utility methods
  }
}

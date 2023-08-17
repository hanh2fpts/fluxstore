import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget(
      {super.key, required this.title, required this.description, required this.imagePath});
  final String title;
  final String description;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 8,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Card(
          color: const Color(0xFFE7E8E9),
          child: Container(
            height: size.height / 2 - 50,
            width: size.width - 100,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Image.asset(
              imagePath,
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}

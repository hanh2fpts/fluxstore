import 'package:flutter/material.dart';

class NeumorphismWidget extends StatefulWidget {
  const NeumorphismWidget({super.key, required this.widget});
  final Widget widget;
  @override
  State<NeumorphismWidget> createState() => _NeumorphismWidgetState();
}

class _NeumorphismWidgetState extends State<NeumorphismWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ]),
      child: widget,
    );
  }
}

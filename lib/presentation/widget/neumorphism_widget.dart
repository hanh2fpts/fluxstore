import 'package:flutter/material.dart';

class NeumorphismWidget extends StatelessWidget {
  const NeumorphismWidget({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(1, 0),
              blurRadius: 1,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0xFFFAFAFA),
              offset: Offset(1, 0),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ]),
      child: widget,
    );
  }
}

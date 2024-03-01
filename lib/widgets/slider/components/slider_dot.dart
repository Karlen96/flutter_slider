import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  const SliderDot({super.key, this.isSelected = false});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColoredBox(
        color: isSelected ? Colors.red : Colors.blue,
        child: const SizedBox(
          width: 12,
          height: 12,
        ),
      ),
    );
  }
}

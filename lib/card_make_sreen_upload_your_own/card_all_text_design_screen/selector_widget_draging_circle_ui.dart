import 'package:flutter/material.dart';

class SelectorWidget extends StatelessWidget {
  int containerColor;
  SelectorWidget({
    Key? key,
    required this.onDrag,
    required this.containerColor,
  }) : super(key: key);

  final Function(double dx, double dy) onDrag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        onDrag(details.delta.dx, details.delta.dy);
      },
      child: Stack(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(containerColor),
              border: Border.all(
                width: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 20, // Fixed height of the hidden container
            width: 20, // Fixed width of the hidden container
            color: Colors.transparent, // Make the container transparent
          ),
        ],
      ),
    );
  }
}

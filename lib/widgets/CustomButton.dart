import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double width;
  final double height;
  const CustomButton({super.key, required this.text, required this.onPress, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: height,
        // width: 175,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontFamily: "Gabarito", fontSize: 20, color: Colors.red),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomClintInfoContainer extends StatelessWidget {
  const CustomClintInfoContainer({
    super.key,
    this.height = 120,
    this.width = 150,
    required this.labelText,
    required this.value,
  });

  final double height, width;
  final String labelText, value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InputDecorator(
        expands: true,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(
              color: Color(0xffFDB6A3),
              width: 2,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInfoTextField extends StatelessWidget {
  const CustomInfoTextField(
      {super.key,
      required this.label,
      required this.value,
      required this.suffix});

  final String label, value;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
      controller: TextEditingController(text: value),
      enabled: false,
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        suffix: suffix,
        label: Text(
          label,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFDB6A3)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

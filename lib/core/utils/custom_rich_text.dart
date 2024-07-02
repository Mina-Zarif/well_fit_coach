import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.text,
    required this.children,
    this.initTextStyle,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final List<TextSpan> children;
  final TextStyle? initTextStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      TextSpan(
        text: text,
        style: initTextStyle ??
            const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.3,
              color: Colors.black,
            ),
        children: children,
      ),
    );
  }
}

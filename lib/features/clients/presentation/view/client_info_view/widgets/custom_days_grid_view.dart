import 'package:flutter/material.dart';

class CustomDaysGridView extends StatelessWidget {
  const CustomDaysGridView({
    super.key,
    required this.height,
    required this.itemCount,
    required this.labelText,
    required this.itemBuilder,
  });

  final double height;
  final int itemCount;
  final String labelText;
  final Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
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
        child: GridView.builder(
          padding: const EdgeInsets.all(5),
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            mainAxisExtent: 50,
          ),
          itemBuilder: (context, index) => itemBuilder(context, index),
          shrinkWrap: true,
          itemCount: itemCount,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChooseProgramView extends StatelessWidget {
  const ChooseProgramView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: height * 0.6, start: 25, end: 25, bottom: height * 0.1),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => const ChooseProgramListItem(),
          itemCount: 4,
        ),
      ),
    );
  }
}

class ChooseProgramListItem extends StatelessWidget {
  const ChooseProgramListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const SizedBox(
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: Row(
            children: [
              Text(
                "Building Muscles Program",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.keyboard_arrow_right_outlined, size: 20)
            ],
          ),
        ),
      ),
    );
  }
}

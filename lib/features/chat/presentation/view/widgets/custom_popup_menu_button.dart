import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/text_styles.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Center(
            child: Text(
              "Pin chat",
              style: Styles.textStyle17,
            ),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Center(
            child: Text(
              "Report",
              style: Styles.textStyle17,
            ),
          ),
        ),
        const PopupMenuItem(
          value: 3,
          child: Center(
            child: Text(
              "Delete Chat",
              style: Styles.textStyle17,
            ),
          ),
        ),
      ],
      offset: const Offset(-15, 40),
      elevation: 5,
    );
  }
}

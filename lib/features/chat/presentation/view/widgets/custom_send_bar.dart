import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';

class CustomSendBar extends StatelessWidget {
  const CustomSendBar(
      {super.key,
      required this.onPressed,
      required this.textEditingController,
      required this.onPickImgTap});

  final Function() onPressed, onPickImgTap;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomTextField(
              contentPadding: EdgeInsets.zero,
              isPassword: true,
              suffixIconData: Icons.add_a_photo_outlined,
              onSuffixIconTap: onPickImgTap,
              elevation: 0.18,
              controller: textEditingController,
              hintText: "Type Messages...",
              hintStyle: const TextStyle(fontSize: 15),
              borderRadius: 50,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: onPressed,
            splashColor: kSplashColor,
            highlightColor: kSplashColor,
            icon: CircleAvatar(
              radius: 27,
              backgroundColor: kMainColor,
              child: SvgPicture.asset(AssetsApp.sendIcon),
            ),
          )
        ],
      ),
    );
  }
}

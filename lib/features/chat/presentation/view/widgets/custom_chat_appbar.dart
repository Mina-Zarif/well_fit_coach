import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';

import 'custom_popup_menu_button.dart';

class CustomChatAppbar extends StatelessWidget {
  const CustomChatAppbar({super.key, required this.onTapBack});

  final Function() onTapBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTapBack,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () => AppRouter.router.pushReplacement(AppRouter.profileView),
          child: const Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              CircleAvatar(
                backgroundColor: kMainColor,
                radius: 27,
                backgroundImage: CachedNetworkImageProvider(
                  clientImageUrl,
                ),
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        const CustomRichText(
          text: "Mina Zarif",
          children: [
            TextSpan(
              text: "\nonline",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff7F7F7F),
                height: 1.9,
              ),
            ),
          ],
        ),
        const Spacer(),
        const CustomPopupMenuButton(),
      ],
    );
  }
}

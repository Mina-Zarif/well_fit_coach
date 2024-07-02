import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';

class ListClientItemView extends StatelessWidget {
  const ListClientItemView(
      {super.key, required this.onTap, required this.profileOnTap});

  final Function() onTap, profileOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: kSplashColor,
      splashColor: kSplashColor,
      child: Row(
        children: [
          InkWell(
            onTap: profileOnTap,
            splashColor: kSplashColor,
            highlightColor: kSplashColor,
            child: const CircleAvatar(
              backgroundColor: kMainColor,
              radius: 33,
              backgroundImage: CachedNetworkImageProvider(clientImageUrl),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: CustomRichText(
              text: "Mina Zarif\n",
              children: [
                TextSpan(
                  text: "Wants To Chat! ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xff7F7F7F),
                  ),
                ),
              ],
              initTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
          const Visibility(
            visible: false,
            child: Text(
              "New!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: kMainColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

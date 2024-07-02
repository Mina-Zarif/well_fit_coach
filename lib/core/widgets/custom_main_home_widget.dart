import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/core/widgets/custom_circular_button.dart';

class CustomMainHomeWidget extends StatelessWidget {
  const CustomMainHomeWidget({
    super.key,
    required this.seeAllOnTap,
    required this.title,
    required this.assetImage,
    required this.customRichText,
  });

  final Function() seeAllOnTap;
  final String title, assetImage;
  final CustomRichText customRichText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsApp.decorationHomeBody),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: seeAllOnTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: CustomMainHomeItem(
          seeAllOnTap: seeAllOnTap,
          title: title,
          assetImage: assetImage,
          customRichText: customRichText,
        ),
      ),
    );
  }
}

class CustomMainHomeItem extends StatelessWidget {
  const CustomMainHomeItem(
      {super.key,
      required this.seeAllOnTap,
      required this.title,
      required this.assetImage,
      required this.customRichText});

  final Function() seeAllOnTap;
  final String title, assetImage;
  final CustomRichText customRichText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: seeAllOnTap,
              child: const Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: kMainColor,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        const Text(
          "July, 2021",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 350,
          height: 170,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsApp.decorationCardBackground),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 17,
              end: 17,
              top: 35,
              bottom: 25,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 15,
                  end: 10,
                  top: 10,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRichText,
                    const Spacer(),
                    CustomCircularButton(
                      child: SvgPicture.asset(
                        assetImage,
                        fit: BoxFit.none,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        // Image.asset(AssetsApp.decorationCardBackground)
      ],
    );
  }
}

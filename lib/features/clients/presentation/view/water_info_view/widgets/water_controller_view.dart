import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/features/clients/presentation/view/water_info_view/widgets/custom_water_icon_style.dart';

class WaterControllerView extends StatelessWidget {
  const WaterControllerView({
    super.key,
    required this.addOnTap,
    required this.removeOnTap,
    required this.buttonOnTap,
  });

  final Function() addOnTap, removeOnTap, buttonOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomWaterIconStyle(
              onTap: removeOnTap,
              height: 40,
              width: 40,
              backgroundColor: const Color(0xff3E537F),
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            CustomWaterIconStyle(
              height: 70,
              width: 70,
              radius: 20,
              backgroundColor: Colors.white,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AssetsApp.waterGlassIcon),
              ),
            ),
            CustomWaterIconStyle(
              onTap: addOnTap,
              height: 40,
              width: 40,
              backgroundColor: const Color(0xff3E537F),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const CustomRichText(
          text: "1x ",
          children: [
            TextSpan(
                text: "Glass 200 ml", style: TextStyle(color: Colors.black))
          ],
          initTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff3E537F),
          ),
        ),
        CustomAppButton(
          label: "Notify",
          onTap: buttonOnTap,
        ),
      ],
    );
  }
}

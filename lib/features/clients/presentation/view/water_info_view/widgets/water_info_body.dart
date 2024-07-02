import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/water_info_view/widgets/custom_water_bar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/water_info_view/widgets/custom_water_oval.dart';
import 'package:well_fit_coach/features/clients/presentation/view/water_info_view/widgets/water_controller_view.dart';

class WaterInfoBody extends StatelessWidget {
  const WaterInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        CustomAppBar(
          leading: const Icon(Icons.arrow_back_ios),
          leadingOnTap: () => AppRouter.router.pop(),
        ),
        const Text(
          "HYDRATION",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xff3E537F),
          ),
        ),
        const CustomRichText(
          text: "Took ",
          textAlign: TextAlign.center,
          initTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xff2D3142),
          ),
          children: [
            TextSpan(
              text: "750",
              style: TextStyle(color: Color(0xffFF592C)),
            ),
            TextSpan(text: " ml of\n water Today 💧")
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Almost there! Keep hydrated",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xff3E537F),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const CustomWaterOval(
          barWidth: 250,
        ),
        const SizedBox(
          height: 8,
        ),
        const CustomWaterBar(
          barWidth: 250,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "good",
          style: GoogleFonts.waterfall(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              color: const Color(0xff5dd2e1)),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(35),
                topEnd: Radius.circular(35),
              ),
              color: Color(0xffF4F6FA),
            ),
            child: WaterControllerView(
              addOnTap: () {},
              buttonOnTap: () {},
              removeOnTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

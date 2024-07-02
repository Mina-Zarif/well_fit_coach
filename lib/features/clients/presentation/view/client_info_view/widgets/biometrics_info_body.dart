import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_biometrics_info_item_view.dart';

class BiometricsInfoBody extends StatelessWidget {
  const BiometricsInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: MediaQuery.sizeOf(context).height * .08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Metrics",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 210,
              ),
              children: [
                CustomBiometricsInfoItemView(
                  onTap: () => AppRouter.router.push(AppRouter.weightInfoView),
                  title: "Weight",
                  titleColor: const Color(0xffFF296A),
                  lastUpdate: "10d",
                  svgImagePath: AssetsApp.weightIcon,
                  value: "75",
                  unit: "kg",
                ),
                CustomBiometricsInfoItemView(
                  onTap: () => AppRouter.router.push(
                    AppRouter.caloriesInfoView,
                  ),
                  title: "CALORIES",
                  titleColor: const Color(0xffE02EA4),
                  lastUpdate: "3m",
                  svgImagePath: AssetsApp.caloriesIcon,
                  value: "75",
                  unit: "Cal",
                ),
                CustomBiometricsInfoItemView(
                  onTap: () => AppRouter.router.push(AppRouter.waterInfoView),
                  title: "Water",
                  titleColor: const Color(0xff3E537F),
                  lastUpdate: "3d",
                  svgImagePath: AssetsApp.waterGlassIcon,
                  value: "750",
                  unit: "ml",
                ),
                CustomBiometricsInfoItemView(
                  onTap: () => AppRouter.router.push(AppRouter.stepsInfoView),
                  title: "Steps",
                  titleColor: const Color(0xff00B592),
                  lastUpdate: "3m",
                  svgImagePath: AssetsApp.testSteps,
                  value: "9,860",
                  unit: "",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/weight_info_view/widgets/custom_weight_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/weight_info_view/widgets/custom_weight_details_view.dart';

class WeightInfoBody extends StatelessWidget {
  const WeightInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
          child: CustomAppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Weight",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            leading: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            leadingOnTap: () => AppRouter.router.pop(),
          ),
        ),
        const CustomWeightAppBar(),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(35),
                topStart: Radius.circular(35),
              ),
            ),
            child: const CustomWeightDetailsView(),
          ),
        ),
      ],
    );
  }
}

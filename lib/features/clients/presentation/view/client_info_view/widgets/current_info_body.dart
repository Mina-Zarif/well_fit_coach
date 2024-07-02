import 'package:flutter/material.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_card_info.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_clint_info_container.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_day_grid_view_item.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_days_grid_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_first_row_info.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_second_row_info.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_third_row_info.dart';

class CurrentInfoBody extends StatelessWidget {
  const CurrentInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36),
        child: Column(
          children: [
            const CustomFirstRowInfo(
              heightValue: "177",
              weightValue: "77",
            ),
            const SizedBox(height: 30),
            const CustomSecondRowInfo(
              birthDate: "27-10-2003",
              genderValue: "male",
            ),
            const SizedBox(height: 30),
            const CustomThirdRowInfo(
              activityLevel: "Lightly",
              fitnessLevel: "Beginner",
            ),
            const SizedBox(height: 30),
            CustomDaysGridView(
              height: size.height * 0.22,
              itemCount: 7,
              itemBuilder: (context, index) => const CustomDayGridViewItem(
                day: "Wednesday",
                active: false,
              ),
              labelText: "Workout Days",
            ),
            const SizedBox(height: 45),
            CustomDaysGridView(
              itemCount: 2,
              height: size.height * 0.11,
              labelText: "Goal",
              itemBuilder: (context, index) => const CustomDayGridViewItem(
                day: "Build Muscles",
                active: false,
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const CustomCardInfo(
                height: 50,
                width: 145,
                value: "Download",
                label: "Inbody",
                centerLabel: true,
                icon: Icon(Icons.download, color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomClintInfoContainer(
                  value: "ISE",
                  labelText: "Health Issues",
                  width: 150,
                ),
                CustomClintInfoContainer(
                  value: "Peanut Butter Shrimp",
                  labelText: "Allergies/DisLikes",
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const CustomClintInfoContainer(
              labelText: "Notes for your Coach",
              value: "Tap To Add Notes",
              height: 150,
              width: 280,
            ),
          ],
        ),
      ),
    );
  }
}

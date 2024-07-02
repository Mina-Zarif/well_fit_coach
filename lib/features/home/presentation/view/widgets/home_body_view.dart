import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/core/widgets/custom_main_home_widget.dart';
import 'package:well_fit_coach/features/home/data/model/coach_response/coach_response.dart';
import 'package:well_fit_coach/features/home/presentation/mange/home_cubit/home_cubit.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/custom_date_picker.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/home_appbar.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key, required this.response, required this.cubit});

  final CoachResponse response;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final AppCubit appCubit = BlocProvider.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 25),
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        shrinkWrap: true,
        children: [
          HomeAppBar(
            dateTime: DateTime.now(),
            imageProfileLink: response.data!.photo!.url!,
            userName: response.data!.firstName!,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => CustomDatePicker(
                onSubmit: (p0) => appCubit.pickDate(p0),
              ),
            ),
          ),
          const SizedBox(height: 40),
          CustomMainHomeWidget(
            title: "My Clients",
            seeAllOnTap: () => appCubit.toggleNavBar(1),
            assetImage: AssetsApp.personOutLinedIcon,
            customRichText: CustomRichText(
              text: "You Have ",
              children: [
                TextSpan(
                  text: response.data!.clients!.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kMainColor,
                  ),
                ),
                const TextSpan(text: " New Client\n"),
                const TextSpan(
                  text: "\nTotal Clients: ",
                  style: TextStyle(
                    height: 1,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: response.data!.clients!.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kMainColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomMainHomeWidget(
            title: "My Meetings",
            seeAllOnTap: () => appCubit.toggleNavBar(3),
            assetImage: AssetsApp.groupIcon,
            customRichText: CustomRichText(
              text: "You Have ",
              children: [
                TextSpan(
                  text: response.data!.upComingMeetings!.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kMainColor,
                  ),
                ),
                const TextSpan(text: " Meeting Today\n"),
                const TextSpan(
                  text: "\nTotal Meetings Upcoming\nThis Week: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: response.data!.upComingMeetings!.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kMainColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

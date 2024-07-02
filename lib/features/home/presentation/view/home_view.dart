import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/clients/presentation/view/clients_view/clients_body.dart';
import 'package:well_fit_coach/features/follow_up/presentation/view/follow_up_view.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_state.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/custom_floating_button.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/custom_navigation_bar.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/home_body.dart';
import 'package:well_fit_coach/features/programs/presentation/view/create_program_view/create_program_view.dart';
import 'package:well_fit_coach/features/programs/presentation/view/programs_view/programs_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of(context);
        return Scaffold(
          extendBody: true,
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
              child: PageView(
                controller: cubit.homePageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  HomeBody(),
                  ClientsBody(),
                  ProgramsView(),
                  FollowUpView(),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateProgramDialog(),
                useSafeArea: true,
              );
            },
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: cubit.currentIndex,
            toggleNavBar: (value) => cubit.toggleNavBar(value),
          ),
        );
      },
    );
  }
}

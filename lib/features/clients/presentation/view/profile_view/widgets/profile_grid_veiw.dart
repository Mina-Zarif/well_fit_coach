import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/features/clients/presentation/view/profile_view/widgets/profile_grid_item_view.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';

class ProfileGridView extends StatelessWidget {
  const ProfileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
      ),
      padding: EdgeInsets.zero,
      children: [
        ProfileGridItemView(
          title: "Subscription",
          assetIcon: AssetsApp.programsIcon,
          onItemTap: () => AppRouter.router.push(AppRouter.subscriptionView),
        ),
        ProfileGridItemView(
          title: "Program",
          assetIcon: AssetsApp.fireIcon,
          onItemTap: () {
            AppRouter.router.pop();
            BlocProvider.of<AppCubit>(context).toggleNavBar(2);
          },
        ),
        ProfileGridItemView(
          title: "Information",
          assetIcon: AssetsApp.informationIcon,
          onItemTap: () => AppRouter.router.push(AppRouter.clientInfoView),
        ),
        ProfileGridItemView(
          title: "History",
          assetIcon: AssetsApp.historyIcon,
          onItemTap: () {
            // TODO: History Screen
          },
        ),
        ProfileGridItemView(
          title: "Create Meeting",
          assetIcon: AssetsApp.groupIcon,
          onItemTap: () {
            // TODO: Create meeting
          },
        ),
        ProfileGridItemView(
          title: "Chat",
          assetIcon: AssetsApp.chatIcon,
          onItemTap: () => AppRouter.router.push(AppRouter.chatView),
        ),
      ],
    );
  }
}

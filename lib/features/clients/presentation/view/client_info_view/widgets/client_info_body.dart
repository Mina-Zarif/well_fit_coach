import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/text_styles.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_cubit.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_state.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/biometrics_info_body.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/current_info_body.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_tap_bar.dart';

class ClientInfoBody extends StatelessWidget {
  const ClientInfoBody({super.key, required this.cubit, required this.state});

  final ClientsCubit cubit;
  final ClientsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomAppBar(
            title: const Text("Client’s Info", style: Styles.textStyle18),
            leading: const Icon(Icons.arrow_back_ios),
            leadingOnTap: () {
              cubit.index = 0;
              AppRouter.router.pop();
            },
          ),
        ),
        CustomTapBar(
          onTap: (index) => cubit.toggleBetweenIndex(index),
          index: cubit.index,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: cubit.pageController,
              children: const [
                CurrentInfoBody(),
                BiometricsInfoBody(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

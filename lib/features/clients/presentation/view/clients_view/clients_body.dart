import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_cubit.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_state.dart';
import 'package:well_fit_coach/features/clients/presentation/view/clients_view/widgets/clients_list_view.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';

class ClientsBody extends StatelessWidget {
  const ClientsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        ClientsCubit cubit = BlocProvider.of(context);
        return Column(
          children: [
            const SizedBox(height: 5),
            CustomAppBar(
              backgroundColor: kBackgroundColor,
              leading: const Icon(Icons.arrow_back_ios_new),
              leadingOnTap: () =>
                  BlocProvider.of<AppCubit>(context).toggleNavBar(0),
              title: const Text(
                "Clients",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cubit.searchController,
              hintText: "Search",
              activeBorderColor: kMainColor,
              borderColor: const Color(0xffBFBFBF),
              prefixIcon: SvgPicture.asset(
                AssetsApp.searchIcon,
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ClientsListView(
                onTap: () => AppRouter.router.push(AppRouter.chatView),
                profileOnTap: () =>
                    AppRouter.router.push(AppRouter.profileView),
              ),
            ),
          ],
        );
      },
    );
  }
}

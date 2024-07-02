import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_cubit.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_state.dart';
import 'package:well_fit_coach/features/clients/presentation/view/profile_view/widgets/profile_grid_veiw.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomAppBar(
              title: const Text(
                "Client’s Profile",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 1.1,
                    color: Colors.black),
              ),
              leading: const Icon(Icons.arrow_back_ios_new),
              leadingOnTap: () => AppRouter.router.pop(),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              backgroundColor: kMainColor,
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(clientImageUrl),
            ),
            const SizedBox(height: 15),
            const Text(
              "Mina Zarif",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 55),
            const Expanded(
              child: ProfileGridView(),
            ),
          ],
        );
      },
    );
  }
}

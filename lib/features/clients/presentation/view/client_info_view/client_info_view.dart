import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_cubit.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_state.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/client_info_body.dart';

class ClientInfoView extends StatelessWidget {
  const ClientInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final ClientsCubit cubit = BlocProvider.of<ClientsCubit>(context);
    return Scaffold(
      body: BlocBuilder<ClientsCubit, ClientsState>(
        builder: (context, state) {
          return ClientInfoBody(
            cubit: cubit,
            state: state,
          );
        },
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/programs_view/widgets/programs_body.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProgramsCubit(),
        child: BlocBuilder<ProgramsCubit, ProgramsState>(
          builder: (context, state) {
            return ProgramsBody(
              cubit: BlocProvider.of<ProgramsCubit>(context),
              state: state,
            );
          },
        ),
      ),
    );
  }
}

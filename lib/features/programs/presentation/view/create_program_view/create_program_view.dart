import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/create_program_view/widgets/create_program_body.dart';
import 'package:well_fit_coach/features/programs/presentation/view/create_program_view/widgets/new_program_body.dart';

class CreateProgramDialog extends StatelessWidget {
  const CreateProgramDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: height * 0.3),
      child: Material(
        borderRadius: BorderRadiusDirectional.circular(35),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: BlocProvider(
            create: (context) => ProgramsCubit(),
            child: BlocBuilder<ProgramsCubit, ProgramsState>(
              builder: (context, state) {
                ProgramsCubit cubit = BlocProvider.of<ProgramsCubit>(context);
                return PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: cubit.dialogController,
                  children: [
                    CreateProgramBody(
                      cubit: cubit,
                      state: state,
                    ),
                    NewProgramBody(
                      cubit: cubit,
                      state: state,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

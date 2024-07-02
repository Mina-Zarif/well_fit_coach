import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/create_program_view/widgets/choose_program_view.dart';

class CreateProgramBody extends StatelessWidget {
  const CreateProgramBody(
      {super.key, required this.cubit, required this.state});

  final ProgramsCubit cubit;
  final ProgramsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => cubit.dialogController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          ),
          splashColor: kSplashColor,
          highlightColor: kSplashColor,
          child: Text(
            "Create New Program",
            style: GoogleFonts.averiaSerifLibre(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          "Or",
          style: GoogleFonts.averiaSerifLibre(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kMainColor,
          ),
        ),
        Text(
          "Choose From Existing Programs",
          style: GoogleFonts.averiaSerifLibre(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ChooseProgramView(),
              useSafeArea: true,
            );
          },
          splashColor: kSplashColor,
          highlightColor: kSplashColor,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffBEBEBE),
              ),
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Program",
                  style: GoogleFonts.averiaSerifLibre(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: const Color(0xff7F7F7F)),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff7F7F7F),
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

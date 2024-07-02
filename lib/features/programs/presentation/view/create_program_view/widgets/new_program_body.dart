import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/custom_date_picker.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_state.dart';

class NewProgramBody extends StatelessWidget {
  const NewProgramBody({super.key, required this.cubit, required this.state});

  final ProgramsCubit cubit;
  final ProgramsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New Program",
          style: GoogleFonts.averiaSerifLibre(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: kMainColor,
          ),
        ),
        Text(
          "Program Name:",
          style: GoogleFonts.averiaSerifLibre(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          errorText: null,
          controller: cubit.newProgramName,
          hintText: "Enter Program Name",
          onChanged: (value) => cubit.onProgramNameValidate(value),
          filledColor: const Color(0xffececed),
          borderRadius: 30,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintStyle: GoogleFonts.averiaSerifLibre(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xffBEBEBE),
          ),
        ),
        Text(
          "Program Length:",
          style: GoogleFonts.averiaSerifLibre(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomDatePicker(
                  startDate: cubit.startDate,
                  endDate: cubit.endDate,
                  dateRangePickerSelectionMode:
                      DateRangePickerSelectionMode.range,
                  onSubmit: (p0) => cubit.selectRangeOfDays(p0),
                ),
              );
            },
            splashColor: kSplashColor,
            highlightColor: kSplashColor,
            child: Text(
              (cubit.startDate != null && cubit.endDate != null)
                  ? "${cubit.endDate!.difference(cubit.startDate!).inDays} Days"
                  : "Tap To Select Program Length",
              style: GoogleFonts.averiaSerifLibre(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: cubit.startDate != null && cubit.endDate != null
                    ? kMainColor
                    : const Color(0xffD8D8D8),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: InkWell(
            onTap: () async {
              if (cubit.startDate != null &&
                  cubit.endDate != null &&
                  cubit.programNameValidation) {
                // TODO : Done
                Navigator.pop(context);
                await cubit.close();
              }
            },
            highlightColor: kSplashColor,
            splashColor: kSplashColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Next",
                  style: TextStyle(
                    color: (cubit.startDate != null &&
                            cubit.endDate != null &&
                            cubit.programNameValidation)
                        ? Colors.black
                        : const Color(0xffD8D8D8),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: (cubit.startDate != null &&
                          cubit.endDate != null &&
                          cubit.programNameValidation)
                      ? Colors.black
                      : const Color(0xffD8D8D8),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

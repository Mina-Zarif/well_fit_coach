import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/auth_cubit/auth_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/auth_cubit/auth_state.dart';
import 'package:well_fit_coach/features/auth/presentation/view/login_view/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            AuthCubit cubit = BlocProvider.of(context);
            return LoginBody(
              cubit: cubit,
              state: state,
            );
          },
        ),
      ),
    );
  }
}

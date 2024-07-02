import 'package:flutter/material.dart';
import 'package:well_fit_coach/features/clients/presentation/view/profile_view/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
        child: ProfileBody(),
      ),
    );
  }
}

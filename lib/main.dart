import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:well_fit_coach/core/utils/service_locator.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_cubit.dart';
import 'package:well_fit_coach/features/follow_up/presentation/mange/followup_cubit/followup_cubit.dart';
import 'package:well_fit_coach/features/home/presentation/mange/home_cubit/home_cubit.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';

import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => FollowUpCubit()..getMeetingsData(),
        ),
        BlocProvider(
          create: (context) => ClientsCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.quicksandTextTheme(),
          useMaterial3: true,
        ),
      ),
    );
  }
}

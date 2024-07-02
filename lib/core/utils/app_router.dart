import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:well_fit_coach/core/widgets/custom_animated_transition_page.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/auth_cubit/auth_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/view/forget_password_view/forget_password_view.dart';
import 'package:well_fit_coach/features/auth/presentation/view/login_view/login_view.dart';
import 'package:well_fit_coach/features/chat/presentation/view/chat_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/calories_info_view/calories_info_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/client_info_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/profile_view/profile_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/steps_info_view/steps_info_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/subscription_view/subscription_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/water_info_view/water_info_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/weight_info_view/weight_info_view.dart';
import 'package:well_fit_coach/features/home/presentation/view/home_view.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/view/add_workout_view/add_workout_view.dart';
import 'package:well_fit_coach/features/splash/splash_view.dart';

abstract class AppRouter {
  static const String splashView = '/d';
  static const String loginView = '/login';
  static const String forgetView = '/forget';
  static const String homeView = '/home';
  static const String profileView = '/profile';
  static const String subscriptionView = '/subscription';
  static const String chatView = '/chat';
  static const String addWorkout = '/workout';
  static const String clientInfoView = '/';
  static const String caloriesInfoView = '/caloriesInfo';
  static const String weightInfoView = '/weightInfoView';
  static const String waterInfoView = '/waterInfo';
  static const String stepsInfoView = '/stepView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: BlocProvider(
            child: const LoginView(),
            create: (context) => AuthCubit(),
          ),
        ),
      ),
      GoRoute(
        path: forgetView,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          child: BlocProvider(
            create: (context) => ForgetCubit(),
            child: const ForgetPasswordView(),
          ),
          context: context,
          state: state,
        ),
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: profileView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: subscriptionView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const SubscriptionView(),
        ),
      ),
      GoRoute(
        path: chatView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const ChatView(),
        ),
      ),
      GoRoute(
        path: addWorkout,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => WorkoutCubit(),
            child: const AddWorkoutView(),
          ),
        ),
      ),
      GoRoute(
        path: clientInfoView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const ClientInfoView(),
        ),
      ),
      GoRoute(
        path: caloriesInfoView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const CaloriesInfoView(),
        ),
      ),
      GoRoute(
        path: weightInfoView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const WeightInfoView(),
        ),
      ),
      GoRoute(
        path: waterInfoView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const WaterInfoView(),
        ),
      ),
      GoRoute(
        path: stepsInfoView,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const StepsInfoView(),
        ),
      ),
    ],
  );
}

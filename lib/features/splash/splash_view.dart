import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    startLoadingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * .27,
          bottom: 25,
        ),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                AssetsApp.logo,
                fit: BoxFit.cover,
                width: 250,
              ),
            ),
            const SizedBox(height: 40),
            DotsIndicator(
              dotsCount: 4,
              mainAxisSize: MainAxisSize.min,
              position: loadingProgress,
              decorator: const DotsDecorator(
                color: Color(0xffFFE6DF),
                activeColor: Color(0xffF15223),
              ),
            ),
            const Spacer(),
            Text(
              "MADE BY VERTEX",
              style: GoogleFonts.inter(
                color: const Color(0xff141416),
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            )
          ],
        ),
      ),
    );
  }

  void startLoadingAnimation() {
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        if (loadingProgress == 3) {
          navigateToHome();
        } else {
          loadingProgress = (loadingProgress + 1) % 4;
          startLoadingAnimation();
        }
      });
    });
  }

  void navigateToHome() async {
    TokenModel? tokenModel = await SecureStorage().readSecureData();
    // AppRouter.router.pushReplacement(AppRouter.loginView);
    AppRouter.router.pushReplacement(
      (tokenModel!.accessToken == null ||
              tokenModel.id == null ||
              tokenModel.refreshToken == null)
          ? AppRouter.loginView
          : AppRouter.homeView,
    );
  }
}

// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key, required this.toggleNavBar, required this.currentIndex});

  final Function(dynamic value) toggleNavBar;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      elevation: 15,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      shadowColor: const Color(0xffdcdcdc),
      notchMargin: 11,
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        useLegacyColorScheme: true,
        type: BottomNavigationBarType.fixed,
        elevation: 7,
        currentIndex: currentIndex,
        onTap: (value) => toggleNavBar(value),
        backgroundColor: Colors.white,
        selectedItemColor: kMainColor,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsApp.homeIcon,
              color: (currentIndex == 0) ? kMainColor : const Color(0xff2D3142),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsApp.personIcon,
              color: (currentIndex == 1) ? kMainColor : const Color(0xff2D3142),
            ),
            label: "Clients",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsApp.programsIcon,
              color: (currentIndex == 2) ? kMainColor : const Color(0xff2D3142),
            ),
            label: "Programs",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsApp.followupIcon,
              color: (currentIndex == 3) ? kMainColor : const Color(0xff2D3142),
            ),
            label: "Follow Up",
          ),
        ],
      ),
    );
  }
}

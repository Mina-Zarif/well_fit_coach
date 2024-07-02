import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/widgets/custom_circular_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.imageProfileLink,
    required this.userName,
    this.onPressed,
    required this.dateTime,
  });

  final String imageProfileLink, userName;
  final Function()? onPressed;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: kMainColor,
          radius: 35,
          backgroundImage: CachedNetworkImageProvider(imageProfileLink),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $userName!",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff7F7F7F),
              ),
            ),
            Text(
              DateFormat('EEEE, d MMMM', 'en_US').format(dateTime),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Spacer(),
        CustomCircularButton(
          onPressed: onPressed ?? () {},
          child: const Icon(
            Icons.calendar_month_outlined,
            color: kMainColor,
          ),
        ),
      ],
    );
  }
}

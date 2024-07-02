import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/text_styles.dart';
import 'package:well_fit_coach/features/follow_up/data/model/meetings_model/datum.dart';

class FollowUpCardItem extends StatelessWidget {
  const FollowUpCardItem({super.key, required this.datum});

  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            border: Border.all(color: const Color(0xffBFBFBF)),
          ),
          padding: const EdgeInsetsDirectional.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Starting in",
                style: Styles.textStyle15,
              ),
              const SizedBox(height: 12),
              Text(
                DateFormat.jm().format(datum.meeting!.date!),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "With",
                style: Styles.textStyle15,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => AppRouter.router.push(AppRouter.profileView),
                child: const CircleAvatar(
                  backgroundColor: kMainColor,
                  backgroundImage: CachedNetworkImageProvider(clientImageUrl),
                  radius: 25,
                ),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () => AppRouter.router.push(AppRouter.profileView),
                child: Text(
                  "${datum.firstName!} ${datum.lastName!}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Meeting link :", style: Styles.textStyle15),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async => await launchUrl(
                  Uri.parse(datum.meeting!.url!),
                ),
                splashColor: kSplashColor,
                highlightColor: kSplashColor,
                child: Text(
                  datum.meeting!.url!,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle15.copyWith(color: kMainColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

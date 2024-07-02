import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomCurrentPlaneBody extends StatelessWidget {
  const CustomCurrentPlaneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const Row(
          children: [
            Text(
              "Branding guideline",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
                height: 2.1,
              ),
            ),
            Spacer(),
            Icon(
              Icons.check,
              color: kMainColor,
            ),
          ],
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5,
      ),
    );
  }
}

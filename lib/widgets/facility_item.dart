import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/controller.dart';
import '../utils/styles.dart';

class FacilityItem extends StatelessWidget {
  // const FacilityItem({Key? key}) : super(key: key);

  final String icon;
  final String name;
  final int amount;
  FacilityItem({required this.icon, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    final dataC = Get.put(DataController()).darkTheme;
    final customColor = Styles.themeData(!dataC);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          width: 32,
          height: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$amount',
            style: purpleTextStyle.copyWith(
                fontSize: 14, color: customColor.errorColor),
            children: [
              TextSpan(
                text: ' $name',
                style: greyTextStyle.copyWith(
                    fontSize: 14, color: customColor.errorColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}

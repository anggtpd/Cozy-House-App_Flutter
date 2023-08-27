import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/controller.dart';
import '../utils/styles.dart';

class BottomNavbarItem extends StatelessWidget {
  //const BottomNavbarItem({super.key});

  final String imageUrl;
  final bool isActive;

  BottomNavbarItem({required this.imageUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container(),
      ],
    );
  }
}

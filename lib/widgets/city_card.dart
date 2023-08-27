import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/models/city.dart';
import 'package:get/get.dart';

import '../providers/controller.dart';
import '../utils/styles.dart';

class CityCard extends StatelessWidget {
  //const CityCard({Key? key}) : super(key: key);

  final City city;
  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    final dataC = Get.put(DataController()).darkTheme;
    final customColor = Styles.themeData(!dataC);
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        // decoration: const BoxDecoration(
        //   boxShadow:
        //   <BoxShadow>[
        //   BoxShadow(color: Colors.black, offset: Offset(0.0, 2.0))
        // ]),
        // decoration: BoxDecoration(border: Border(bottom:)),
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36.0),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/icon_star.png',
                              width: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

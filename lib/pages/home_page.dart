import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/providers/controller.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/utils/styles.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/tips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var spaceProvider = Provider.of<SpaceProvider>(context);
    SpaceProvider.getRecommendedSpaces();
    final dataC = Get.put(DataController()).darkTheme;
    final customColor = Styles.themeData(!dataC);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // NOTE: TITLE/HEADER
          children: [
            SizedBox(
              height: edge,
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Explore Now',
                        style: blackTextStyle.copyWith(
                            fontSize: 24,
                            // color: customColor.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Mencari kosan yang cozy',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          // color: customColor.secondaryHeaderColor
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: GetBuilder<DataController>(
                    init: DataController(),
                    builder: (data) {
                      return Row(
                        children: [
                          Switch(
                              activeColor: customColor.primaryColor,
                              inactiveThumbColor: customColor.primaryColor,
                              value: data.darkTheme,
                              onChanged: (sw) {
                                data.changeTheme(sw);
                              })
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: edge,
            ),

            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                  // color: customColor.primaryColor
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Aceh',
                      imageUrl: 'assets/images/city5.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Bogor',
                      imageUrl: 'assets/images/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                  // color: customColor.primaryColor
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: FutureBuilder(
                future: SpaceProvider.getRecommendedSpaces(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // NOTE: TIPS & GUIDANCE
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      update: 'Updated 20 Apr',
                      imageUrl: 'assets/images/tips1.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      update: 'Updated 11 Dec',
                      imageUrl: 'assets/images/tips2.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
            color: Color(0xffF6f7f8),
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(color: customColor.errorColor, blurRadius: 10)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

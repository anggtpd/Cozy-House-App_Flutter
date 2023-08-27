import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/providers/controller.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/styles.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({super.key});

  // @override
  // State<DetailPage> createState() => _DetailPageState();

  final Space space;
  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      // if (_isFavorited) {
      //   _isFavorited = false;
      // } else {
      //   _isFavorited = true;
      // }
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataC = Get.put(DataController()).darkTheme;
    final customColor = Styles.themeData(!dataC);
    launchUrl(String url) async {
      if (await canLaunchUrlString(url)) {
        launchUrlString(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Konfirmasi'),
                content:
                    Text('Apakah kamu yakin akan menghubungi pemilik kos ini?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () {
                      launchUrlString('tel:${widget.space.phone}');
                    },
                    child: Text('Hubungi'),
                  ),
                ]);
          });
    }

    Future<void> _showMyPic(String dt) async {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content: Stack(children: [
                Positioned(
                  top: 0,
                  // right: Get.width * 0.5,
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close,
                        color: Colors.amber,
                      )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    dt,
                    // width: 110,
                    // height: 88,
                    fit: BoxFit.cover,
                  ),
                ),
              ]),
              backgroundColor: Colors.transparent,
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: customColor.primaryColorDark,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                        fontSize: 16,
                                        color: customColor.errorColor),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating),
                                );
                              }).toList(),
                              // RatingItem(
                              //   index: 1,
                              //   rating: space.rating,
                              // ),
                              // RatingItem(
                              //   index: 2,
                              //   rating: space.rating,
                              // ),
                              // RatingItem(
                              //   index: 3,
                              //   rating: space.rating,
                              // ),
                              // RatingItem(
                              //   index: 4,
                              //   rating: space.rating,
                              // ),
                              // RatingItem(
                              //   index: 5,
                              //   rating: space.rating,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: ' kitchens',
                              icon: 'assets/images/icon_kitchen.png',
                              amount: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: ' bedrooms',
                              icon: 'assets/images/icon_bedroom.png',
                              amount: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: ' cupboards',
                              icon: 'assets/images/icon_cupboard.png',
                              amount: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: PHOTOS
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        padding: EdgeInsets.only(right: edge),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos.map((item) {
                              return InkWell(
                                onTap: () {
                                  // Get.rawSnackbar(

                                  //   icon: Image.network(
                                  //     item,
                                  //     width: 110,
                                  //     height: 88,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  //   // titleText: Container(
                                  //   //   child: Image.network(
                                  //   //     item,
                                  //   //     width: 110,
                                  //   //     height: 88,
                                  //   //     fit: BoxFit.cover,
                                  //   //   ),
                                  //   // ),
                                  //   snackStyle: SnackStyle.GROUNDED,
                                  //   margin: EdgeInsets.symmetric(
                                  //       vertical: Get.height * 0.4),
                                  //   // title: 'judul',
                                  //   // backgroundColor: Colors.amber,
                                  //   overlayColor: Colors.grey.withOpacity(0.6),
                                  //   overlayBlur: 0.1,
                                  //   message: 'Pesan',

                                  // );
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(

                                  //   backgroundColor: Colors.transparent,
                                  //   content: Center(
                                  //     child: Container(
                                  //       child: Image.network(
                                  //         item,
                                  //         width: 110,
                                  //         height: 88,
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ));
                                  // Get.bottomSheet(
                                  //   Center(
                                  //     child: Container(
                                  //       height: Get.height,
                                  //       color: Colors.transparent,
                                  //       child: Image.network(

                                  //         item,
                                  //         // width: 110,
                                  //         // height: 88,
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   backgroundColor: Colors.transparent,
                                  //   ignoreSafeArea: true,

                                  //   barrierColor: Colors.transparent,
                                  // );
                                  _showMyPic(item);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: edge),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrlString(widget.space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/images/btn_map.png',
                                width: 40,
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // NOTE: BTN BOOK NOW
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                            onPressed: () {
                              _showMyDialog();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                purpleColor,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    17.0,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            )),
                        // child: ElevatedButton(
                        //   onPressed: (() => showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) => AlertDialog(
                        //             title: Text('Konfirmasi'),
                        //             content: Text(
                        //                 'Apakah kamu yakin akan menghubungi pemilik kos ini?'),
                        //             actions: [
                        //               TextButton(
                        //                 onPressed: () =>
                        //                     Navigator.pop(context, 'Cancel'),
                        //                 child: const Text('Tidak'),
                        //               ),
                        //               TextButton(
                        //                 onPressed: () {
                        //                   launchUrlString(
                        //                       'tel:${widget.space.phone}');
                        //                 },
                        //                 child: Text('Ok'),
                        //               ),
                        //             ],
                        //           ))),
                        //   style: ButtonStyle(
                        //     backgroundColor: MaterialStateProperty.all(
                        //       purpleColor,
                        //     ),
                        //     shape: MaterialStateProperty.all<
                        //         RoundedRectangleBorder>(
                        //       RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(
                        //           17.0,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     'Book Now',
                        //     style: whiteTextStyle.copyWith(fontSize: 18),
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: edge, vertical: Get.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                      height: 40,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    child: Image.asset(
                      _isFavorited
                          ? 'assets/images/btn_wishlist_yellow.png'
                          : 'assets/images/btn_wishlist.png',
                      width: 40,
                      height: 40,
                    ),
                    onTap: _toggleFavorite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

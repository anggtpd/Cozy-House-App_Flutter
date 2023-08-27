import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/splash_image.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Find Cozy House\nto Stay and Happy',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 12,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      purpleColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          17.0,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    'Explore Now',
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

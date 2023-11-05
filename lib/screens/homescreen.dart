import 'package:age_calculator_app/utils/constants.dart';
import 'package:age_calculator_app/utils/mainview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../AdHelper/adshelper.dart';
import '../utils/sliderview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
  GlobalKey<SliderDrawerState>();
  late String title_app;
  late String title;


  Future<void>? _launched;

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;


  @override
  void initState() {
    title_app = "Age Calculator";
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfHomeScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();

  }


  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BalsamiqSans'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SliderDrawer(
            appBar: SliderAppBar(
                appBarColor: Colors.white,
                title: Text(
                    title_app,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w600,))

                ),
              // trailing: Padding(
              //   padding: const EdgeInsets.only(right:8.0),
              //   child: Icon(Icons.share),
              // ),
            ),
            key: _sliderDrawerKey,
            sliderOpenSize: 179,
            slider: SliderView(
              onItemClick: (title) {
                if(title == "Home")
                  {
                    _sliderDrawerKey.currentState!.closeSlider();
                  }
                else if (title == "Share")
                  {
                    launchShare();
                  }
                else if (title == "Rate Us")
                {
                  launchPlay();

                }
                else if (title == "More Apps")
                {
                  launchMoreApps();

                }


                setState(() {
                  this.title = title;
                });
              },
            ),
            child: MainView()

        ),

        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isBannerAdReady)
              Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
          ],
        ),

      ),
    );
  }

  void launchPlay() async {
    LaunchReview.launch(
      androidAppId: androidAppIdValue,
      iOSAppId: iOSAppIdValue,);
  }



  void launchMoreApps() async {
    const url = 'https://play.google.com/store/apps/developer?id=Darshan+Komu';  // Replace with your desired URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchShare() {
    Share.share('Download  Age Calculator App ${androidAppShareLink}');

  }


}

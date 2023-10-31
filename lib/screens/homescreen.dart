import 'package:age_calculator_app/utils/constants.dart';
import 'package:age_calculator_app/utils/mainview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void initState() {
    title_app = "Age Calculator";
    super.initState();
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

                )

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
                    launchPlay();
                  }
                else if (title == "Rate Us")
                {
                  launchMoreApps();
                }
                else if (title == "More Apps")
                {
                  launchPlay();
                }
                else {
                  openSetting();
                }

                setState(() {
                  this.title = title;
                });
              },
            ),
            child: MainView()

        ),
      ),
    );
  }

  void launchPlay() async {
    LaunchReview.launch(
      androidAppId: androidAppIdValue,
      iOSAppId: iOSAppIdValue,);
  }

  void openSetting() async {

  }

  void launchMoreApps() async {
    const url = 'https://play.google.com/store/apps/developer?id=Darshan+Komu';  // Replace with your desired URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}

import 'dart:async';
import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:age_calculator_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var pickedTodaysDate = DateTime.now();
  var pickedTodaysDOBDate = DateTime.now();
  var  duration;
  var  next_duration;

  var yourDOB = "DD - MM - YYYY";
  var todaysDate;
  var totalYears = 0;
  var check = 0;

  TextEditingController dateController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {


    String formattedTodaysDate = DateFormat('dd - MM - yyyy').format(pickedTodaysDate);
    print(formattedTodaysDate);
    todaysDate = formattedTodaysDate;
    duration = AgeCalculator.age(pickedTodaysDOBDate);
    next_duration = AgeCalculator.age(pickedTodaysDOBDate);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0,left: 8.0,right: 8.0),
            child: Container(
              width: double.infinity,
              height: 310,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.black87,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Your Date of Birth",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                              ),
                              GestureDetector(
                                onTap: () {
                                  refresh(pickedTodaysDate);

                                  setState(() {
                                    yourDOB = "DD - MM - YYYY";
                                    String formattedDate = DateFormat('dd - MM - yyyy').format(DateTime.now());
                                    todaysDate = formattedDate;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right:14.0),
                                  child: Icon(Icons.cached_rounded, color: Colors.white,size: 28,),
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              callDOBDate();

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top:12.0,left:4,right:4),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left:14.0),
                                      child: yourDOB == "DD - MM - YYYY"  ? Text(
                                          yourDOB.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18, color: Colors.black38,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                                      ) : Text(
                                          yourDOB.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18, color: Colors.black87,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:14.0),
                                      child: Icon(Icons.calendar_month_outlined, color: Colors.black,size: 28,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                      ),
                      SizedBox(height: 14,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Today's Date",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                          ),
                          GestureDetector(
                            onTap: () {
                              callTodays();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top:12.0,left:4,right:4),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left:14.0),
                                      child: Text(
                                          todaysDate,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:14.0),
                                      child: Icon(Icons.calendar_month_outlined, color: Colors.black,size: 28,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )



                        ],
                      ),
                      SizedBox(height: 20,),
                      
                      GestureDetector(
                        onTap: () {
                              calculateAge(pickedTodaysDate,pickedTodaysDOBDate);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              border: Border.all(
                                color: Colors.teal,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Calculate my age",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
          Screenshot(
            controller: screenshotController,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0,left: 8.0,right: 8.0),
              child: Container(
                width: double.infinity,
                height: 430,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.black87,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "You Age",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                                ),
                                // GestureDetector(
                                //     onTap: ()
                                //     {
                                //       captureImg();
                                //     },
                                //     child: Icon(Icons.share,color: Colors.white,))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurpleAccent,
                                          border: Border.all(
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child:  Center(
                                        child: duration != null ? Text(
                                            duration.years.toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                        ) : Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                        "Years",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          border: Border.all(
                                            color: Colors.blueAccent,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child:  Center(
                                        child: duration != null ? Text(
                                            duration.months.toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                        ):  Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                        "Months",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.cyan,
                                          border: Border.all(
                                            color: Colors.cyan,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child:  Center(
                                        child:duration != null ? Text(
                                            duration.days.toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                        ): Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                        "Days",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 1,color: Colors.white70,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0,left: 8.0,right: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Years: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                          '${((pickedTodaysDate.difference(pickedTodaysDOBDate).inDays > 365) && check ==1 ) ?  NumberFormat("###,###", "en_US").format((pickedTodaysDate.difference(pickedTodaysDOBDate).inDays/365).floor()).toString() : '0' }',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Months: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                          '${((pickedTodaysDate.difference(pickedTodaysDOBDate).inDays > 30) && check ==1 ) ?  NumberFormat("###,###", "en_US").format((pickedTodaysDate.difference(pickedTodaysDOBDate).inDays/30).floor()).toString() : '0' }',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Weeks: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                          '${((pickedTodaysDate.difference(pickedTodaysDOBDate).inDays > 7) && check ==1 ) ?  NumberFormat("###,###", "en_US").format((pickedTodaysDate.difference(pickedTodaysDOBDate).inDays/7).floor()).toString() : '0' }',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Days: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                           check == 1 ? NumberFormat("###,###", "en_US").format(pickedTodaysDate.difference(pickedTodaysDOBDate).inDays).toString() : '0',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Hours: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                          check == 1 ? NumberFormat("###,###", "en_US").format(pickedTodaysDate.difference(pickedTodaysDOBDate).inHours).toString() : '0',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Minutes: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                          check == 1 ? NumberFormat("###,###", "en_US").format(pickedTodaysDate.difference(pickedTodaysDOBDate).inMinutes).toString() : '0',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Seconds: ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                      Text(
                                          check == 1 ? NumberFormat("###,###", "en_US").format(pickedTodaysDate.difference(pickedTodaysDOBDate).inSeconds).toString() : '0',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0,left: 8.0,right: 8.0),
            child: Container(
              width: double.infinity,
              height: 210,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.black87,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                                "Your Next Birthday is on",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                            ),

                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        border: Border.all(
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child:  Center(
                                      child: Text(
                                          AgeCalculator.timeToNextBirthday(pickedTodaysDOBDate,  fromDate: pickedTodaysDate).months.toString() ,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 36,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                      "Months",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        border: Border.all(
                                          color: Colors.blueAccent,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child:  Center(
                                      child: Text(
                                          AgeCalculator.timeToNextBirthday(pickedTodaysDOBDate,  fromDate: pickedTodaysDate).days.toString() ,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 36,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                      "Days",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          // Center(
                          //   child: RichText(
                          //     text: const TextSpan(
                          //       text: 'Your birthday is on ',
                          //
                          //       style: TextStyle(
                          //         fontSize: 18
                          //       ),
                          //       children: [
                          //         TextSpan(
                          //           text: 'Thursday',
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.w800,
                          //           ),
                          //         ),
                          //         TextSpan(
                          //           text: '  this year',
                          //           style: TextStyle(
                          //               fontSize: 18
                          //           ),
                          //         ),
                          //       ],
                          //     )),
                          // ),




                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  void callDOBDate() async {
    pickedTodaysDOBDate = (await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate:DateTime(1900), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101)
    ))!;

    if(pickedTodaysDOBDate != null ){
      print(pickedTodaysDOBDate);
      String formattedDate = DateFormat('dd - MM - yyyy').format(pickedTodaysDOBDate);
      print(formattedDate);
      setState(() {
        yourDOB = formattedDate;
      });
    }

  }

  void callTodays() async {
    pickedTodaysDate = (await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate:DateTime(1900), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101)
    ))!;

    if(pickedTodaysDate != null ){
      print(pickedTodaysDate);
      String formattedDate = DateFormat('dd - MM - yyyy').format(pickedTodaysDate);

      print(formattedDate);
      setState(() {
        todaysDate = formattedDate;
      });
    }

  }

  void refresh(today)
  {

     pickedTodaysDate = DateTime.now();
     pickedTodaysDOBDate = DateTime.now();

     // setState(() {
     //   duration = AgeCalculator.age( today);
     // });
    check = 0;
  }

  void calculateAge(DateTime today, DateTime dob) {

    if(yourDOB == "DD - MM - YYYY")
      {
        duration = AgeCalculator.age(today);
      }
    else{

      // nextDOB(today, dob);

      setState(() {
        duration = AgeCalculator.age(dob,today: today);
      });


      // Duration diff = today.difference(dob);

      check = 1;
    }

  }

  // void nextDOB(DateTime today, DateTime dob)
  // {
  //   next_duration = AgeCalculator.timeToNextBirthday(dob,  fromDate: today);
  //
  //   print('You next birthday will be in $next_duration');
  //
  // }


  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Age Calculator"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }

  // void captureImg() async {
  //   await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((Uint8List image) async {
  //     if (image != null) {
  //       final directory = await getApplicationDocumentsDirectory();
  //       final imagePath = await File('${directory.path}/image.png').create();
  //       await imagePath.writeAsBytes(image);
  //
  //       /// Share Plugin
  //       await Share.shareFiles([imagePath.path]);
  //     }
  //   } as FutureOr Function(Object? value) );
  //
  // }
}


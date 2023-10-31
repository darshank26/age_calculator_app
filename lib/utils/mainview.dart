import 'package:age_calculator_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
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
                          Text(
                              "Your Date of Birth",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
                          ),
                          Padding(
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
                                        "26 - 05 - 1996",
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
                          Padding(
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
                                        "01 - 11 - 2023",
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
                          )



                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
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
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0,left: 8.0,right: 8.0),
            child: Container(
              width: double.infinity,
              height: 450,
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
                          Text(
                              "You Age",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.8))
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
                                          "0",
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
                                      child: Text(
                                          "0",
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
                                      child: Text(
                                          "0",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
                                        "0",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w200,letterSpacing: 0.8))
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
          Padding(
            padding: const EdgeInsets.only(top: 4.0,left: 8.0,right: 8.0),
            child: Container(
              width: double.infinity,
              height: 250,
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
                                          "0",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 36,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 0.8))
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
                                      child: Text(
                                          "0",
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
                            ],
                          ),
                          SizedBox(height: 15,),
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Your birthday is on ',

                                style: TextStyle(
                                  fontSize: 18
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Thursday',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  this year',
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  ),
                                ],
                              )),
                          ),




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
}

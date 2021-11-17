
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:slide_countdown/slide_countdown.dart';

class HomePage extends StatefulWidget {
  // defaultDuration = Duration(days: 2, hours: 2, minutes: 30);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool checkedValue = false;
  bool checkboxValue = false;
  var pinDigit;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(

            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 200),
                child: OTPTextField(
                  length: 5,
                  // width: MediaQuery.of(context).size.width,
                  width: 200,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 30,
                  fieldStyle: FieldStyle.underline,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                    pinDigit = pin;
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                    pinDigit = pin;
                  },
                ),
              ),

              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text("click"),
                  onPressed: () {
                    String sss = pinDigit;
                    if (sss.isEmpty) {
                      int l = 54;
                    } else if (sss.length < 5) {
                      int a = 54;
                    } else {
                      int f = 54;
                      // send request
                    }
                  }),

              SizedBox(
                height: 20,
              ),


              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SlideCountdown(
                      duration: Duration(minutes: 1 ,seconds: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      fade: true,
                      // separatorType: SeparatorType.title,
                      durationTitle: DurationTitle.id(),

                      // icon: const Padding(
                      //   padding: EdgeInsets.only(right: 5),
                      //   child: Icon(
                      //     Icons.alarm,
                      //     color: Colors.white,
                      //     size: 20,
                      //   ),
                      // ),
                      slideDirection: SlideDirection.up,
                      onDone: () {
                        int a = 5;
                      },
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}

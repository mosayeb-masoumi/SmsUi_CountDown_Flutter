import 'dart:async';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {



  Duration duration = Duration(seconds: 10);
  Timer? timer;


  bool showTimer = false;

  @override
  Widget build(BuildContext context) {




    return Scaffold(
            body: Center(
                child: Column(
                    children: [

                      SizedBox(height: 100,),
                      RaisedButton(
                          child: Text("start timer"),
                          onPressed: () {
                            setState(() {

                              if(!showTimer){
                                showTimer = true;
                                startTimer();
                              }

                            });
                          }),

                      SizedBox(height: 20,),


                      showTimer == true
                          ?
                      buildTimer()
                          : Container()

                    ]
                )
            )
        );

  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1),(_)=> addTimer());
  }


  addTimer() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds - addSeconds;
      duration = Duration(seconds: seconds);

      if(seconds ==-1){
        timer?.cancel();
        duration = Duration(seconds: 10);
        showTimer = false;
      }
    });
  }


  Widget buildTimer() {

    String twoDigits(int n) => n.toString().padLeft(2 ,"0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));



    return Text("$minutes:$seconds" ,style: TextStyle(fontSize: 80 , color: Colors.black),);
  }



}







//
//
//
// late AnimationController _controller;
//
// @override
// void initState() {
//   super.initState();
//   // _controller = AnimationController(vsync: this, duration: Duration(minutes: 1 ,seconds: 3));
//   // _controller.forward();
// }
//
// bool showTimer =false;
//
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//
//     home: Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//
//             SizedBox(height: 100,),
//             RaisedButton(
//                 onPressed: (){
//                   setState(() {
//                     _controller = AnimationController(vsync: this, duration: Duration(minutes: 0 ,seconds: 10));
//                     _controller.forward();
//                     showTimer = true;
//                   });
//                 }),
//
//             showTimer == true ? Countdown(
//               animation: StepTween(
//                 begin: 10,
//                 end: 0,
//
//               ).animate(_controller),
//             ):Container(),
//
//
//
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// @override
// void dispose() {
//   _controller.dispose();
//   super.dispose();
// }

// Countdown({Animation<int>? animation}) {
//
//   Duration clockTimer = Duration(seconds: animation!.value);
//
//   String timerText =
//       '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';
//
//   return Text(
//     "$timerText",
//     style: TextStyle(
//       fontSize: 50,
//       color: Theme.of(context).primaryColor,
//     ),
//   );
// }


// }
//
// class Countdown extends AnimatedWidget {
//   Countdown({Key? key, required this.animation}) : super(key: key, listenable: animation);
//   Animation<int> animation;
//
//   @override
//   build(BuildContext context) {
//     Duration clockTimer = Duration(seconds: animation.value);
//
//     String timerText =
//         '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';
//
//     return Text(
//       "$timerText",
//       style: TextStyle(
//         fontSize: 50,
//         color: Theme.of(context).primaryColor,
//       ),
//     );
//   }
// }



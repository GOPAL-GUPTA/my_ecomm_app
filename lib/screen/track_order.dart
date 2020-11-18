// // import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//
// // import 'package:flutter/rendering.dart';
// //
// class Trackorder extends StatefulWidget {
//   static const String routename = 'Trackorder';
//   @override
//   _TrackorderState createState() => _TrackorderState();
// }
//
// class _TrackorderState extends State<Trackorder> {
//   @override
//   Widget build(BuildContext context) {
//     final devicesize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         // backgroundColor: Colors.transparent,
//         // elevation: 0,
//         centerTitle: true,
//         title: Text('order track'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "Order No.001",
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             Text(
//               "Order confirrmed ready to pick",
//               style: TextStyle(color: Colors.grey, fontSize: 15.0),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15.0),
//               child: Divider(
//                 height: 1.0,
//                 color: Colors.grey,
//               ),
//             ),
//             Stack(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(left: 5, top: 34.0),
//                   width: 5.0,
//                   height: devicesize.height * 0.45,
//                   color: Colors.grey.withOpacity(0.5),
//                 ),
//                 Column(
//                   children: <Widget>[
//                     StatusWidget('Confirmed', true),
//                     StatusWidget('Picked up', false),
//                     StatusWidget('In process', false),
//                     StatusWidget('Shipped', false),
//                     StatusWidget('Delivered', false),
//                   ],
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15.0),
//               child: Divider(
//                 height: 1.0,
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               children: <Widget>[
//                 InkWell(
//                   splashColor: Color(0XFFFF4081),
//                   onTap: () {},
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10.0),
//                       ),
//                       border: Border.all(
//                         color: Color(0XFFFF4081),
//                       ),
//                     ),
//                     child: Text(
//                       'Cancel order',
//                       style:
//                           TextStyle(color: Color(0XFFFF4081), fontSize: 15.0),
//                     ),
//                   ),
//                 )
//               ],
//             )
//
//             // Container(
//             //   height: 1.0,
//             //   margin: EdgeInsets.symmetric(vertical: 15.0),
//             //   color: Colors.grey,
//             // )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Container StatusWidget(String status, bool isActive) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 30.0),
//       child: Row(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isActive ? Color(0XFFFF4081) : Colors.white,
//                 border: Border.all(
//                     color: isActive ? Colors.transparent : Color(0XFFFF4081),
//                     width: 8.0)),
//           ),
//           const SizedBox(
//             width: 50.0,
//           ),
//           Text(
//             status,
//             style: TextStyle(
//               color: isActive ? Color(0XFFFF4081) : Colors.black,
//               fontSize: 20.0,
//               fontWeight: FontWeight.w500,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class Trackorder extends StatefulWidget {
  Trackorder({Key key}) : super(key: key);
  static const String routename = 'Trackorder';
  @override
  _TrackorderState createState() => _TrackorderState();
}

class _TrackorderState extends State<Trackorder> with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 8800),
      vsync: this,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('trackorder'),
        centerTitle: true,
      ),
      body: AnimatedBar(controller: animationController),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  final dotsize = 20.0;
  final AnimationController controller;
  final Animation<Color> dotOneColor;
  final Animation<TextStyle> textOneStyle;
  final Animation<double> progressBarOne;
  final Animation<Color> dotTwoColor;
  final Animation<TextStyle> textTwoStyle;
  final Animation<double> progressBarTwo;
  final Animation<Color> dotThreeColor;
  final Animation<TextStyle> textThreeStyle;
  final Animation<double> progressBarThree;
  final Animation<Color> dotFourColor;
  final Animation<TextStyle> textFourStyle;
  final Animation<double> progressBarFour;

  AnimatedBar({Key key, this.controller})
      : dotOneColor = ColorTween(
          begin: Colors.grey,
          end: Colors.yellow,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.000,
              curve: Curves.linear,
            ),
          ),
        ),
        textOneStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.000, 0.000, curve: Curves.linear)),
        ),
        progressBarOne = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.100, 0.200, curve: Curves.linear),
          ),
        ),
        dotTwoColor = ColorTween(
          begin: Colors.grey,
          end: Colors.yellow,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000, 0.000, // 0.450,
              // 0.550,
              curve: Curves.linear,
            ),
          ),
        ),
        textTwoStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.000, 0.000, curve: Curves.linear)),
        ),
        progressBarTwo = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.200, 0.300, curve: Curves.linear),
          ),
        ),
        dotThreeColor = ColorTween(
          begin: Colors.grey,
          end: Colors.yellow,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000, 0.000, // 0.450,
              // 0.550,
              curve: Curves.linear,
            ),
          ),
        ),
        textThreeStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.000, 0.000, curve: Curves.linear)),
        ),
        progressBarThree = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.300, 0.400),
          ),
        ),
        dotFourColor = ColorTween(
          begin: Colors.grey,
          end: Colors.yellow,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000, 0.000, // 0.450,
              // 0.550,
              curve: Curves.linear,
            ),
          ),
        ),
        textFourStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.000, 0.000, curve: Curves.linear)),
        ),
        progressBarFour = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.400, 0.500),
          ),
        ),
        //
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Container(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Order No.001",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                "Order confirrmed ready to pick",
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // width: devicesize.width / 1.3,
                    height: devicesize.height * 0.60,
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: dotsize,
                          height: dotsize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(dotsize / 2),
                              color: dotOneColor.value),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 2,
                            // child:
                            // RotationTransition(
                            //   turns: AlwaysStoppedAnimation(90 / 360),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: progressBarOne.value,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow),
                              ),
                            ),
                            // ),
                          ),
                        ),
                        // SizedBox(width: 10),
                        SizedBox(height: 10),

                        Container(
                          width: dotsize,
                          height: dotsize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(dotsize / 2),
                              color: dotTwoColor.value),
                        ),
                        // SizedBox(width: 10),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // height: 2,
                            width: 2,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: progressBarTwo.value,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        Container(
                          width: dotsize,
                          height: dotsize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(dotsize / 2),
                              color: dotThreeColor.value),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 2,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: progressBarThree.value,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: dotsize,
                          height: dotsize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(dotsize / 2),
                              color: dotFourColor.value),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 2,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: progressBarFour.value,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: dotsize,
                          height: dotsize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(dotsize / 2),
                              color: dotThreeColor.value),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        // Divider(
                        //   thickness: 2.0,
                        //   color: Colors.grey,
                        // ),
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: devicesize.height * 0.60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Confirmed',
                          style: textOneStyle.value,
                        ),
                        Text(
                          'PickedUp',
                          style: textTwoStyle.value,
                        ),
                        Text(
                          'In Process',
                          style: textTwoStyle.value,
                        ),
                        Text(
                          'Shipped',
                          style: textTwoStyle.value,
                        ),
                        Text(
                          'Delivered',
                          style: textTwoStyle.value,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                height: 0.0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                splashColor: Color(0XFFFF4081),
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: Color(0XFFFF4081),
                    ),
                  ),
                  child: Text(
                    'Cancel order',
                    style: TextStyle(color: Color(0XFFFF4081), fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// Container(
//   margin: EdgeInsets.only(top: 5),
//   width: MediaQuery.of(context).size.width / 1.2,
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Text(
//         'Confirmed',
//         style: textOneStyle.value,
//       ),
//       Text(
//         'PickedUp',
//         style: textTwoStyle.value,
//       ),
//       Text(
//         'In Process',
//         style: textTwoStyle.value,
//       ),
//       Text(
//         'Shipped',
//         style: textTwoStyle.value,
//       ),
//       Text(
//         'Delivered',
//         style: textTwoStyle.value,
//       ),
//     ],
//   ),
// )
////////////////////////////////////////////////////////////////////////////////

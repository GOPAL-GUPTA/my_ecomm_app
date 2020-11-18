//
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:grk_001/Constants/constants.dart';
//
// class PaymentScreen extends StatefulWidget {
//   final String amount;
//   PaymentScreen({this.amount});
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   WebViewController _webController;
//   String _loadHTML() {
//     return "<html><body onload='documents.f.submit();'><form id ='f' name ='f' method='post',action='$PAYMENT_URL'><input type='hidden' name='orderID' value='${ORDER_DATA["orderID"]}'/>" +
//         "<input type='hidden' name='custID' value='${ORDER_DATA["custID"]}'/>" +
//         "<input type='hidden' name='amount' value='${widget.amount}'/>" +
//         "<input type='hidden' name='custEmail' value =${ORDER_DATA["custEmail"]}/>" +
//         "<input type='hidden' name='custPhone' value='${ORDER_DATA["custPhone"]}'/>" +
//         "</form></body></html>";
//     // <input type='hidden' name='orderID' value='11121155511515'/>" +
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose\
//     _webController = null;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: WebView(
//             debuggingEnabled: false,
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (controller) {
//               _webController = controller;
//               _webController.loadUrl(
//                    Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString());
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

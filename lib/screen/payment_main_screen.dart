import 'package:flutter/material.dart';
import 'package:grk_001/screen/payment_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class PaytmPayment extends StatefulWidget {
  static const String routename = 'paytmpayment';

  @override
  _PaytmPaymentState createState() => _PaytmPaymentState();
}

class _PaytmPaymentState extends State<PaytmPayment> {
  TextEditingController _amountController = new TextEditingController();
  Razorpay razorpay;
  String amount;

  @override
  void initState() {
    // TODO: implement initState
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    razorpay.clear();
    super.dispose();
  }

  void openCheckout() {
    var Options = {
      "key": "rzp_test_F8j3SAIH2TNoKT",
      "amount": num.parse(
            _amountController.text,
          ) *
          100,
      'name': 'GRBK001',
      'description': 'Pens',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(Options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void handlerPaymentSuccess() {
    print('Payment Success');
    Toast.show("PaymentSuccess", context);
  }

  void handlerErrorFailure() {
    print('Payment Error');
    Toast.show("Payment Error", context);
  }

  void handlerExternalWallet() {
    print('External Wallet');
    Toast.show("external wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paytm Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter amount',
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              openCheckout();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => PaymentScreen(
              //           amount: amount,
              //         )));
            },
            color: Colors.blue,
            child: Text(
              "Proceed to check out",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

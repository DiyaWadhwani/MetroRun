import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:nanoid/nanoid.dart';
import 'ticket.dart';

double amountToBePaid = 0;
void sendAmount(double amount) {
  amountToBePaid = amount;
}

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Razorpay razorpay;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: amountToBePaid.toString(),
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_V7WQ6qHKF4DGDk",
      "amount": num.parse(_controller.text) * 100,
      "name": "Metro Run",
      "description": "Ticket Booking",
      "prefill": {"contact": " ", "email": " "},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Payment success");
    Toast.show("Payment success", context);
    var id = nanoid();
    var custom_length_id = nanoid(10);
    Navigator.of(context).pushNamed('/qrcodepage');

    //Widget build(BuildContext context) {}
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    print("Payment error");
    Toast.show("Payment error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet Error", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  prefixText: _controller.text,
                  prefixStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  helperText: "Amount to be paid",
                  helperStyle: TextStyle(fontSize: 15.0)),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Pay",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}

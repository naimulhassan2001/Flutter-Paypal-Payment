import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/controller/payment_controller.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';

class PaypalPaymentDemo extends StatelessWidget {
  PaypalPaymentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaypalPaymentDemp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaymentController.instance.paymentPaypal(),
              ));
            },
            child: const Text('Pay with paypal'),
          ),
        ),
      ),
    );
  }
}

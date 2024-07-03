
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  TextEditingController amountController = TextEditingController();


  static PaymentController get instance => Get.put(PaymentController());


  paymentPaypal() {
    return PaypalCheckoutView(
      sandboxMode: true,
      clientId:
      "AaCH5bLv0gDhHMrW3gbqchECbFFJjLnkhRmfeQlGuFdp441uPkiXEnuW5MS5QHndFS2JEMWhsogkcSRm",
      secretKey:
      "EOu1iAOF9P0uDwkyKfWUfzUB4WjfUAi38GEi1U2QjdjP8MfQRNAZ5JoQGDwvDJunDxTFZPL15DVKpSxF",
      transactions: const [
        {
          "amount": {
            "total": "100",
            "currency": "USD",
            "details": {
              "subtotal": "100",
              "shipping": '0',
              "shipping_discount": '0'
            }
          },
          "description": "The payment transaction description.",
          "item_list": {
            "items": [
              {
                "name": "Apple",
                "quantity": 1,
                "price": "100",
                "currency": "USD"
              },
            ],
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        Get.snackbar("Payment successful", "");
        Navigator.pop(Get.context!);
        if (kDebugMode) {
          print("onSuccess: $params");
        }
      },
      onError: (error) {
        Navigator.pop(Get.context!);
        Get.snackbar("Something went wrong,", "Try again!");
        if (kDebugMode) {
          print("onError: $error");
        }

      },
      onCancel: () {
        Navigator.pop(Get.context!);
        Get.snackbar("Payment cancelled", "");
        if (kDebugMode) {
          print('cancelled:');
        }
      },
    ) ;
  }

}
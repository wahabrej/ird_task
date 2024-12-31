import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ird_task/features/home/presentation/screen/constant.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        100,
        "usd",
      );
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Abdul Wahab",
        ),
      );

      await _processPayment();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };

      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );

      if (response.data != null) {
        debugPrint("Payment Intent Response: ${response.data}");
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

Future<void> _processPayment() async {
  try {
    await Stripe.instance.presentPaymentSheet();
    await Stripe.instance.confirmPaymentSheetPayment();
  } catch (e) {
    debugPrint(e.toString());
  }
  return;
}

String _calculateAmount(int amount) {
  final calculatedAmount = amount * 100;
  return calculatedAmount.toString();
}

import 'package:flutter/material.dart';
import 'package:ird_task/payment_serbices.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stripe Payment"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Trigger the payment flow
            await StripeService.instance.makePayment();
          },
          child: Text("Pay \$100"),
        ),
      ),
    );
  }
}

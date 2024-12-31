// import 'package:flutter/material.dart';
// import 'app.dart';
// import 'core/services/storage_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await StorageService.init();
//   runApp(const MyApp());
// }
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ird_task/features/home/presentation/screen/constant.dart';
import 'package:ird_task/payment_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Stripe with the publishable key
  Stripe.publishableKey = stripePublishableKey;
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(),
    );
  }
}

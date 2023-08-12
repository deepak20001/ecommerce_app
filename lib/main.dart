import 'package:ecommerce_app/constants/theme.dart';
import 'package:ecommerce_app/firebase_helper/firebase_options/firebase_options.dart';
import 'package:ecommerce_app/provider/app_provider.dart';
import 'package:ecommerce_app/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'screens/auth_ui/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "Add publishable key here";
  await Firebase.initializeApp(
    // if want to run for ios also then add 2 platform in firebase_options file with the required id, key, etc
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E Commerce",
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHepler.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CustomBottomBar();
            }
            return const Welcome();
          },
        ),
      ),
    );
  }
}

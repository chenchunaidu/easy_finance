import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_finance/layout/get-page-wrapper.dart';
import 'package:easy_finance/screens/account.dart';
import 'package:easy_finance/screens/home.dart';
import 'package:easy_finance/screens/login.dart';
import 'package:easy_finance/screens/otp.dart';
import 'package:easy_finance/theme/index.dart';
import 'package:get/get.dart';
import 'package:easy_finance/helpers/auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'helpers/translations.dart';

void initialize() {
  // inject authentication controller
  Get.put(AuthController());
}

void main() async {
  initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // handles firebase crash reporting
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetStorage storage = GetStorage();
  final authController = Get.find<AuthController>();
  late StreamSubscription<User?> firebaseAuthSubscription;

  @override
  void initState() {
    firebaseAuthSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        authController.login(user);
      } else {
        authController.logout();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    firebaseAuthSubscription.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(storage.read("locale-language") ?? 'en',
          storage.read("locale-country") ?? 'IN'),
      translations: Messages(),
      initialRoute: '/home',
      getPages: getPageWrapper([
        // PageWrapper(path: '/login', child: Login(), navbar: false),
        PageWrapper(path: '/home', child: const HomeScreen()),
        PageWrapper(path: '/profile', child: const Account()),
        // PageWrapper(path: "/otp", child: const OTP(), navbar: false)
      ]),
      // routingCallback: routingCallback,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      // home: HomeScreen(),
    );
  }
}

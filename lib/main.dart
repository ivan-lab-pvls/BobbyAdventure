import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rat_match/util/app_routes.dart';
import 'package:rat_match/views/result/hfsdgsa.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/result/bgfd.dart';
import 'views/settings/view/settings_screen.dart';

int? initScreen;
late final SharedPreferences fsd;
late SharedPreferences fsadcdas;
final remoteConfig = FirebaseRemoteConfig.instance;
final inAppReview = InAppReview.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fsd = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: fsdagasdf.currentPlatform);
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 7),
    minimumFetchInterval: const Duration(seconds: 7),
  ));
  await Notx().activate();
  fsadcdas = await SharedPreferences.getInstance();
  asdfsd();
  runApp(MyApp());
}

Future<void> asdfsd() async {
  bool gfdsgfdsfds = fsd.getBool('star') ?? false;
  if (!gfdsgfdsfds) {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      await fsd.setBool('star', true);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: chsadfBobby(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data ?? false) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
              DeviceOrientation.portraitDown,
              DeviceOrientation.portraitUp,
            ]);
            return ShowBobbyAdventureBonus(
              recebonuxpt: amxa,
            );
          } else {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.green),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.splash,
            );
          }
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}

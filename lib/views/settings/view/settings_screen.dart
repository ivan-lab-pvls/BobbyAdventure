import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rat_match/views/app/widgets/navigation_button.dart';
import 'package:rat_match/views/consts/app_colors.dart';
import 'package:rat_match/views/consts/app_text_style/settings_style.dart';

import '../../../util/app_routes.dart';
import '../../app/view/my_in_app_web_view.dart';

String amxa = '';
final remoteConfig = FirebaseRemoteConfig.instance;

Future<String> isBobbyAddGift(String loands) async {
  final client = HttpClient();
  var uri = Uri.parse(loands);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  if (response.headers
      .value(HttpHeaders.locationHeader)
      .toString()
      .contains('showAgreeButton')) {
    return '';
  } else {
    return loands;
  }
}

Future<bool> chsadfBobby() async {
  try {
    await remoteConfig.fetchAndActivate();
    final String showing = remoteConfig.getString('bobbyGame');
    if (showing.contains('isNOtbobbyGame')) {
      return false;
    } else {
      amxa = await isBobbyAddGift(showing);
      return true;
    }
  } catch (e) {
    return false;
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.025,
            child: NavigationButton(
              assetName: 'assets/images/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonWidth: size.width * 0.08,
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -(size.height * 0.1),
                  right: -(size.width * 0.08),
                  child: Image.asset(
                    'assets/images/chipmunk.png',
                    height: size.height * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Color(0xFFEC9851),
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'PRIVACY POLICY',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyShowTerms(
                                  url:
                                      'https://docs.google.com/document/d/1Lx1dPc_7WM0fKFugq-5sxOi5F8IP3cnZn0hyYdZIRz8/edit?usp=sharing'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Color(0xFFEC9851),
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'TERMS OF USE',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyShowTerms(
                                  url:
                                      'https://docs.google.com/document/d/1m6jnsM3rPaSojifPbyD3isgDl27mCtxpsxcI0SQbBlg/edit?usp=sharing'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            AppColors.brownColor,
                            //   Color(0xFFEC9851),
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'RATE APP',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          InAppReview.instance.openStoreListing(
                            appStoreId: '6475681296',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowBobbyAdventureBonus extends StatelessWidget {
  final String recebonuxpt;

  const ShowBobbyAdventureBonus({super.key, required this.recebonuxpt});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 37, 254),
        body: SafeArea(
          bottom: false,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(recebonuxpt),
            ),
          ),
        ),
      ),
    );
  }
}
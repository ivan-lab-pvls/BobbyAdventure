import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rat_match/views/onboarding/widget/start_game_widget.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../util/app_routes.dart';
import '../widget/speech_bubble.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //size=
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        )),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              child: Image.asset('assets/images/chipmunk.png'),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: const SpeechBubble(
                    text1: 'Bobby Adventure',
                    text2:
                        'Welcome to Bobby Adventure!',
                  ),
                ),
                StartGameButton(
                  onTap: () {
                    context.read<OnboardingCubit>().setFirstTime();
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}

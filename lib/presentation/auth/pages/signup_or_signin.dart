import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/common/helpers/is_dark_mode.dart';
import 'package:projects/common/widgets/button/basic_app_button.dart';
import 'package:projects/core/configs/assets/app_vectors.dart';
import 'package:projects/core/configs/theme/app_colors.dart';

import '../../../core/configs/assets/app_images.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.topPattern),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.bottomPattern),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.signupSigninBg)),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 40),
                  const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {},
                          title: "Register",
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    ));
  }
}

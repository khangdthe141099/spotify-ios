import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/core/configs/assets/app_images.dart';
import 'package:projects/core/configs/assets/app_vectors.dart';
import 'package:projects/core/configs/theme/app_colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projects/presentation/choose_mode/pages/choose_mode.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 40
            ),
            //Tương tự background
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBG),
                fit: BoxFit.fill,
              )
            ),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                    )
                ),
                const SizedBox(height: 20),
                const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                        fontSize: 13,
                    ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context, PageTransition(type: PageTransitionType.fade, child: const ChooseModePage()), ModalRoute.withName('/'));
                  },
                  title: "Continue",
                )
              ],
            ),
          ),

         /* Container(
            color: Colors.black.withOpacity(0.15),
          )*/
        ],
      )
    );
  }
}

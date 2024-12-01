import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/common/widgets/button/basic_app_button.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseMode),
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
                  "Choose mode",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                  },
                  title: "Get Started",
                )
              ],
            ),
          ),
          
          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      )
    );
  }
}

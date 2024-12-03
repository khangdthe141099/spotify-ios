import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projects/common/widgets/appbar/app_bar.dart';
import 'package:projects/common/widgets/button/basic_app_button.dart';
import 'package:projects/common/widgets/password/password.dart';
import 'package:projects/core/configs/assets/app_vectors.dart';
import 'package:projects/core/configs/theme/app_colors.dart';
import 'package:projects/presentation/auth/pages/signup.dart';
import 'package:projects/presentation/auth/pages/signup_or_signin.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppbar(
        action: (IconButton(
          icon: Icon(Icons.home_filled),
          color: AppColors.primary,
          onPressed: () => {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: const SignupOrSigninPage()),
                ModalRoute.withName('/'))
          },
        )),
        title: Column(
          children: [
            SvgPicture.asset(
              AppVectors.logo,
              height: 40,
              width: 40,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 30),
              _descText(),
              const SizedBox(height: 30),
              _fullNameField(context),
              const SizedBox(
                height: 20,
              ),
              const PasswordField(),
              const SizedBox(
                height: 30,
              ),
              BasicAppButton(
                onPressed: () {},
                title: "Sign In",
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(color: Color(0xffD3D3D3)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Or", style: TextStyle(color: Color(0xffD3D3D3))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(color: Color(0xffD3D3D3)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 8, left: 8, right: 8),
                    child: SvgPicture.asset(AppVectors.google),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(AppVectors.apple))
                ],
              )
            ],
          )),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _descText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If You Need Any Support',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        const SizedBox(width: 5),
        const Text(
          'Click Here',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff38B432)),
        )
      ],
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Enter username or email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member? ',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const SignupPage()),
                    ModalRoute.withName('/'));
              },
              child: const Text('Register now',
                  style: TextStyle(color: Color(0xff38B432))))
        ],
      ),
    );
  }
}
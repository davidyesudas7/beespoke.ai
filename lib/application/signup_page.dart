import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:beespoke_shopping/application/login/widgets/login_singnup_widgets.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static ValueNotifier singnupnotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppbarcolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/beespoke_logo.png',
              width: 300,
            ),
            kSpaceheight20,
            const SignUpWidget(),
          ],
        ),
      ),
    );
  }
}

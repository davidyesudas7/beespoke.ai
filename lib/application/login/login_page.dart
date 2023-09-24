import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:beespoke_shopping/application/home/home_page.dart';
import 'package:beespoke_shopping/application/login/bloc/login_bloc.dart';
import 'package:beespoke_shopping/application/login/widgets/login_singnup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(InitialEvent());
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
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is TokenPresentState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('login sucsess full'),
                    ),
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                }
              },
              builder: (context, state) {
                if (state is TokenPresentState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Loginwidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

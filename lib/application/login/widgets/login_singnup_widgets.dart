import 'package:beespoke_shopping/application/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:beespoke_shopping/application/login/bloc/login_bloc.dart';
import 'package:beespoke_shopping/application/login/widgets/logpage_button.dart';
import 'package:beespoke_shopping/application/login/signup_page.dart';

// SignUpWidget is a widget for the sign-up form.
class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Username input field
        TextFormField(
          decoration: InputDecoration(
            hintText: 'User Name',
            filled: true,
            fillColor: kWhitecolor,
            border: kOutlineborder,
          ),
        ),
        kSpaceheight10,
        // Password input field
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
            filled: true,
            fillColor: kWhitecolor,
            border: kOutlineborder,
          ),
        ),
        kSpaceheight10,
        // Confirm Password input field
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            filled: true,
            fillColor: kWhitecolor,
            border: kOutlineborder,
          ),
        ),
        kSpaceheight20,
        // Sign-Up Button
        LogPageButton(
          ontap: () {
            Navigator.pop(context);
          },
          name: 'Sign Up',
        ),
      ],
    );
  }
}

// Loginwidget is a widget for the login form.
class Loginwidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Loginwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroler = TextEditingController();
    TextEditingController passwordcontroler = TextEditingController();
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
          // Navigate to the Home Page upon successful login
        } else if (state is LoginFailureState) {
          // Display an error message to the user in a Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter a valid username and password'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              // Username input field
              TextFormField(
                controller: usernamecontroler,
                decoration: InputDecoration(
                  hintText: 'User Name',
                  filled: true,
                  fillColor: kWhitecolor,
                  border: kOutlineborder,
                ),
              ),
              kSpaceheight10,
              // Password input field
              TextFormField(
                controller: passwordcontroler,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: kWhitecolor,
                  border: kOutlineborder,
                ),
              ),
              kSpaceheight20,
              // Login Button
              LogPageButton(
                ontap: () {
                  // Dispatch a LoginButtonPressed event to the LoginBloc

                  BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
                      username: usernamecontroler.text.trim(),
                      password: passwordcontroler.text.trim()));
                },
                name: 'Login',
              ),
              // Sign Up button
              TextButton(
                onPressed: () {
                  // Navigate to the Sign-Up Page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, color: kBluecolor800),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

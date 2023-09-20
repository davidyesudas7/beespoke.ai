import 'package:beespoke_shopping/application/cart/bloc/cart_bloc.dart';
import 'package:beespoke_shopping/application/home/bloc/home_bloc.dart';
import 'package:beespoke_shopping/application/login/bloc/login_bloc.dart';
import 'package:beespoke_shopping/application/login/login_page.dart';
import 'package:beespoke_shopping/core/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beespoke_shopping/core/injections.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'BeepSpoke Shopping',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade200),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

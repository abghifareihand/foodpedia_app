import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:foodpedia_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:foodpedia_app/presentation/auth/bloc/user/user_bloc.dart';
import 'package:foodpedia_app/presentation/auth/pages/login_page.dart';
import 'package:foodpedia_app/presentation/auth/pages/register_page.dart';
import 'package:foodpedia_app/presentation/auth/pages/splash_page.dart';
import 'package:foodpedia_app/presentation/home/bloc/food/food_bloc.dart';
import 'package:foodpedia_app/presentation/home/bloc/order/order_bloc.dart';
import 'package:foodpedia_app/presentation/profile/bloc/logout/logout_bloc.dart';
import 'package:foodpedia_app/presentation/transaction/bloc/transaction/transaction_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => FoodBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const SplashPage(),
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:foodpedia_app/presentation/auth/bloc/user/user_bloc.dart';
import 'package:foodpedia_app/presentation/auth/pages/login_page.dart';
import 'package:foodpedia_app/presentation/dashboard/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else {
        debugPrint(user.email);
        context.read<UserBloc>().add(GetUserEvent(userId: user.uid));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FOODPEDIA',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
                letterSpacing: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

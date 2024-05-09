import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodpedia_app/core/components/spaces.dart';
import 'package:foodpedia_app/presentation/auth/pages/login_page.dart';
import 'package:foodpedia_app/presentation/profile/bloc/logout/logout_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SpaceHeight(50),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.read<LogoutBloc>().add(LogoutUserEvent());
              },
              child: BlocConsumer<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  if (state is LogoutLoaded) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  }

                  if (state is LogoutError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LogoutLoading) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 24,
                      ),
                    );
                  }
                  return const Text('Logout');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

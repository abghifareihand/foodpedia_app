import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodpedia_app/core/components/dialog.dart';
import 'package:foodpedia_app/core/components/spaces.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:foodpedia_app/core/constants/images.dart';
import 'package:foodpedia_app/presentation/auth/bloc/user/user_bloc.dart';
import 'package:foodpedia_app/presentation/auth/pages/login_page.dart';
import 'package:foodpedia_app/presentation/profile/bloc/logout/logout_bloc.dart';
import 'package:foodpedia_app/presentation/profile/widgets/list_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          width: 120,
                          height: 120,
                          AppImage.user,
                        ),
                      ),
                      const SpaceHeight(16),
                      Text(
                        state.userResponse.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        state.userResponse.email!,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),

          ListMenu(
            icon: Icons.person,
            title: 'Edit Profile',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    title: 'Edit Profile',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          ListMenu(
            icon: Icons.privacy_tip,
            title: 'Privacy & Policy',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    title: 'Privacy & Policy',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          ListMenu(
            icon: Icons.info,
            title: 'About App',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    title: 'About App',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          ListMenu(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    title: 'Settings',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          const SpaceHeight(20),

          /// Button logout
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
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

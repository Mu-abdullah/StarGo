import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seller/core/utils/app_routs.dart';
import 'package:seller/core/widgets/custom_button.dart';

import '../../../../core/function/firebase_service.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_buttons.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    MyFirebaseMessaging().setupFirebase(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const HomeAppBar(),
              const HomeButtons(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    onPress: () async {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.loginScreen);
                      await FirebaseAuth.instance.signOut();
                    },
                    buttonName: "تسجيل خروج"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

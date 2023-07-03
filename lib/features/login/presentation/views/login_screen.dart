import 'package:flutter/material.dart';

import 'widgets/login_screen_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: LoginScreenViewBody(),
      )),
    );
  }
}

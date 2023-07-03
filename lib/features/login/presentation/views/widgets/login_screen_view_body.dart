import 'package:flutter/material.dart';
import 'package:seller/core/utils/assets.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/utils/texts.dart';

import 'login_feiled.dart';

class LoginScreenViewBody extends StatelessWidget {
  const LoginScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleTexts(
              text: "تسجيل دخول",
              fontSize: 50,
              fontFamily: AssetDate.messiriFont,
            ),
            Container(
              width: CustomSize().widthSize(context, 1),
              height: CustomSize().heightSize(context, .3),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(AssetDate.logo),
            ),
            LoginFeild(),
          ],
        ),
      ),
    );
  }
}

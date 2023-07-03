import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seller/core/utils/app_routs.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_alert_dialog_with_progress_indecator.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../manger/cubit/login_cubit.dart';

class LoginFeild extends StatelessWidget {
  LoginFeild({
    super.key,
  });

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          alertWithCircleProgress(context, titleText: "جاري تسجيل الدخول");
        } else if (state is LoginSuccess) {
          Navigator.pop(context);

          GoRouter.of(context).pushReplacement(AppRouter.homeScreen);
          await FirebaseMessaging.instance.subscribeToTopic('admin');
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hint: "الإيميل",
                label: "الإيميل",
                prefix: const Icon(Iconsax.user_octagon),
                isPassword: false,
                controller: mailController,
                fontFamily: AssetDate.messiriFont,
                type: TextInputType.emailAddress,
                maxLines: 1,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "الإيميل مطلوب";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: "الباسورد",
                label: "الباسورد",
                fontFamily: AssetDate.messiriFont,
                prefix: const Icon(Iconsax.lock),
                isPassword: true,
                controller: passwordController,
                type: TextInputType.visiblePassword,
                maxLines: 1,
                validate: (dynamic value) {
                  if (value!.isEmpty) {
                    return "الباسورد مطلوب";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                width: 1,
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    cubit.login(
                      emailAddress: mailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                buttonName: "قم بالدخول",
              ),
            ],
          ),
        );
      },
    );
  }
}

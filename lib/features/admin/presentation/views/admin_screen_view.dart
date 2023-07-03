import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/admin_screen_cubit/admin_screen_cubit.dart';
import 'widgets/admin_screen_view_body.dart';

class AdminScreenView extends StatelessWidget {
  const AdminScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminScreenCubit>(
      create: (context) => AdminScreenCubit(),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            body: AdminScreenViewBody(),
          ),
        ),
      ),
    );
  }
}

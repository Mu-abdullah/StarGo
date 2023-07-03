import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/order_cubit/order_screen_cubit.dart';
import 'widgets/order_screen_body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderScreenCubit()..fetchDocuments(),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            body: OrderScreenBody(),
          ),
        ),
      ),
    );
  }
}

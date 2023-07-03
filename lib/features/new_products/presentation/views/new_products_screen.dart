import 'package:flutter/material.dart';

import 'widgets/new_product_body.dart';

class NewProductScreenView extends StatelessWidget {
  const NewProductScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: NewProductScreenViewBody(),
        ),
      ),
    );
  }
}

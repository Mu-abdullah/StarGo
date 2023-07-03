import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/texts.dart';

class NoItemHere extends StatelessWidget {
  const NoItemHere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TitleTexts(
            text: "لا يوجد اصناف هنا",
            fontFamily: AssetDate.messiriFont,
          ),
          TitleTexts(
            text: "اضغط على زر الاضافة",
            fontFamily: AssetDate.messiriFont,
          ),
        ],
      ),
    );
  }
}
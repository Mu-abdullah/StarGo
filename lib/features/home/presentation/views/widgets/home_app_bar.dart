import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomSize().widthSize(context, 1),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: AppColors.mintGreenColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TitleTexts(
              text: "اهلا وسهلا",
              fontSize: 36,
              titleColor: AppColors.whiteColor,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TitleTexts(
                text: "Pizza Star Go",
                titleColor: AppColors.primaryColor,
                fontFamily: AssetDate.righteousFont,
                fontSize: 36,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

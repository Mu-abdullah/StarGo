import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seller/core/widgets/custom_form_field.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/app_routs.dart';
import '../../../../core/utils/size.dart';
import '../../data/model/product_model.dart';
import '../manger/edit_cubit/edit_screen_cubit.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productPriceS = TextEditingController();
  final TextEditingController productPriceL = TextEditingController();
  final TextEditingController productPriceM = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  late String category;

  @override
  void initState() {
    super.initState();
    productName.text = widget.product.name ?? '';
    productPriceS.text = widget.product.priceS.toString();
    productPriceL.text = widget.product.priceL.toString();
    productPriceM.text = widget.product.priceM.toString();
    productDescription.text = widget.product.description ?? '';
    category = widget.product.category!;
  }

  @override
  Widget build(BuildContext context) {
    String? categoryValue = category;
    return BlocConsumer<EditScreenCubit, EditScreenState>(
      listener: (context, state) {
        if (state is SuccessEditData) {}
      },
      builder: (context, state) {
        EditScreenCubit cubit = EditScreenCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: CustomSize().heightSize(context, .08),
                        decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TitleTexts(
                              text: "أضافة صنف جديد",
                              titleColor: AppColors.primaryColor,
                              fontFamily: AssetDate.messiriFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                                hint: "اسم الصنف",
                                label: "اسم الصنف",
                                fontFamily: AssetDate.messiriFont,
                                prefix: const Icon(Iconsax.task),
                                isPassword: false,
                                controller: productName,
                                type: TextInputType.name,
                                maxLines: 1,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'الاسم مطلوب';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: const [
                                  Icon(Iconsax.money),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TitleTexts(
                                    text: "السعر",
                                    fontFamily: AssetDate.messiriFont,
                                    fontSize: 24,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomTextField(
                                      hint: "صغير",
                                      label: "صغير",
                                      prefix: const Icon(Iconsax.money),
                                      fontFamily: AssetDate.messiriFont,
                                      isPassword: false,
                                      controller: productPriceS,
                                      type: TextInputType.number,
                                      maxLines: 1,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'السعر مطلوب';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return "يجب ان يكون رقم";
                                        }
                                        return null;
                                      }),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomTextField(
                                      hint: "وسط",
                                      label: "وسط",
                                      prefix: const Icon(Iconsax.money),
                                      fontFamily: AssetDate.messiriFont,
                                      isPassword: false,
                                      controller: productPriceM,
                                      type: TextInputType.number,
                                      maxLines: 1,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'السعر مطلوب';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return "يجب ان يكون رقم";
                                        }
                                        return null;
                                      }),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomTextField(
                                      hint: "كبير",
                                      label: "كبير",
                                      prefix: const Icon(Iconsax.money),
                                      fontFamily: AssetDate.messiriFont,
                                      isPassword: false,
                                      controller: productPriceL,
                                      type: TextInputType.number,
                                      maxLines: 1,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'السعر مطلوب';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return "يجب ان يكون رقم";
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 2,
                                      color: AppColors.blackColor
                                          .withOpacity(.3))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Iconsax.category),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: TitleTexts(
                                      text: "الفئة",
                                      fontFamily: AssetDate.messiriFont,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButton(
                                      alignment: Alignment.center,
                                      style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontFamily: AssetDate.messiriFont),
                                      isExpanded: false,
                                      hint: const TitleTexts(
                                        text: "اختار الفئة",
                                        titleColor: AppColors.blueColor,
                                        fontSize: 18,
                                      ),
                                      items: cubit.dropdownItems,
                                      value: cubit.selectedValue,
                                      onChanged: (String? value) {
                                        cubit.changeValue(value!);
                                        categoryValue = value;
                                      },
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                      dropdownColor: Colors.grey[350],
                                      underline: const Text(""),
                                      elevation: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                hint: "مكونات الصنف",
                                label: "مكونات الصنف",
                                prefix: const Icon(Iconsax.task_square4),
                                fontFamily: AssetDate.messiriFont,
                                isPassword: false,
                                controller: productDescription,
                                type: TextInputType.text,
                                maxLines: 5,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'المكونات مطلوبة';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: state is LoadindEditData
                            ? CircularProgressIndicator(
                                color: AppColors.primaryColor,
                                backgroundColor:
                                    AppColors.blackColor.withOpacity(.5),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomButton(
                                        onPress: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            final product = ProductModel(
                                                name: productName.text,
                                                priceS: double.parse(
                                                    productPriceS.text),
                                                priceM: double.parse(
                                                    productPriceM.text),
                                                priceL: double.parse(
                                                    productPriceL.text),
                                                description:
                                                    productDescription.text,
                                                category: categoryValue ??
                                                    widget.product.category,
                                                adminMail:
                                                    "${FirebaseMessaging.instance.getToken()}",
                                                id: widget.product.id);
                                            cubit.updateProductField(
                                                context, product);
                                          }
                                        },
                                        buttonName: "تعديل الصنف",
                                        backgroungColor: AppColors.blueColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomButton(
                                        onPress: () {
                                          GoRouter.of(context)
                                              .replace(AppRouter.adminScreen);
                                        },
                                        titleColor: AppColors.whiteColor,
                                        buttonName: "إلغاء",
                                        backgroungColor: AppColors.secondColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

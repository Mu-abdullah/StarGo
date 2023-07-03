import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seller/core/utils/app_routs.dart';

import '../../../../../core/function/random_id.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../admin/data/model/product_model.dart';
import '../../manger/add_data_cubit/add_data_cubit.dart';
import '../../manger/add_data_cubit/add_data_state.dart';

class NewProductScreenViewBody extends StatefulWidget {
  const NewProductScreenViewBody({
    super.key,
  });

  @override
  State<NewProductScreenViewBody> createState() =>
      _NewProductScreenViewBodyState();
}

class _NewProductScreenViewBodyState extends State<NewProductScreenViewBody> {
  final TextEditingController productName = TextEditingController();

  final TextEditingController productPriceS = TextEditingController();

  final TextEditingController productPriceL = TextEditingController();

  final TextEditingController productPriceM = TextEditingController();

  final TextEditingController productDescription = TextEditingController();

  String? categoryValue;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDataCubit, AddDataState>(
      listener: (context, state) {
        if (state is SuccessSendData) {
          GoRouter.of(context).pushReplacement(AppRouter.loadingScreen);
        }
      },
      builder: (context, state) {
        AddDataCubit cubit = AddDataCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleTexts(
                      text: "أضافة صنف جديد",
                      fontFamily: AssetDate.messiriFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              width: 1,
                              color: categoryValue == null
                                  ? AppColors.secondColor
                                  : AppColors.blackColor.withOpacity(.3))),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
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
                    Center(
                      child: state is LoadindSendData
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
                                        if (formKey.currentState!.validate()) {
                                          final adminMail = FirebaseAuth.instance.currentUser!.email;
                                          final id = generateDocumentId();
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
                                                  "لن يتم عرضها",
                                              adminMail: adminMail,
                                              id: id);
                                          cubit.addDocument(product);
                                        }
                                      },
                                      buttonName: "أضف الصنف",
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
                                            .pop(AppRouter.homeScreen);
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
          )),
        );
      },
    );
  }
}

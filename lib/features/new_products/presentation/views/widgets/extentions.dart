import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seller/core/utils/assets.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_button.dart';
import 'package:seller/core/widgets/custom_form_field.dart';
import 'package:seller/features/new_products/data/model/extention_model.dart';

import '../../../../../core/function/random_id.dart';
import '../../../../../core/utils/constanent.dart';
import '../../manger/extention_cubit/extention_cubit.dart';

class ExtentionsScreen extends StatefulWidget {
  const ExtentionsScreen({super.key});

  @override
  State<ExtentionsScreen> createState() => _ExtentionsScreenState();
}

class _ExtentionsScreenState extends State<ExtentionsScreen> {
  final TextEditingController name = TextEditingController();

  final TextEditingController price = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? eName;
  String? ePrice;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExtentionCubit(),
      child: BlocConsumer<ExtentionCubit, ExtentionState>(
        listener: (context, state) {
          if (state is SuccessSendData) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          ExtentionCubit cubit = ExtentionCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleTexts(
                        text: "الاضافات",
                        fontFamily: AssetDate.messiriFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hint: "الاسم",
                        label: "الاسم",
                        fontFamily: AssetDate.messiriFont,
                        prefix: const Icon(Iconsax.personalcard),
                        isPassword: false,
                        controller: name,
                        type: TextInputType.name,
                        maxLines: 1,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "الاسم مطلوب";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          eName = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hint: "السعر",
                        label: "السعر",
                        fontFamily: AssetDate.messiriFont,
                        prefix: const Icon(Iconsax.call),
                        isPassword: false,
                        controller: price,
                        type: TextInputType.number,
                        maxLines: 1,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "الهاتف مطلوب";
                          }
                          if (double.tryParse(value) == null) {
                            return "يجب ان يكون رقم";
                          }

                          return null;
                        },
                        onSaved: (value) {
                          ePrice = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        loadingState: state is LoadingSendData ? true : false,
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            final extention = ExtentionModel(
                              id: generateDocumentId(),
                              name: name.text,
                              priceL: price.text,
                              category: Constant.extentionsKey,
                            );
                            cubit.sendExtention(extention);
                          }
                        },
                        buttonName: "حفظ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

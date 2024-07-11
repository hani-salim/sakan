import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/appbar.dart';
import 'package:sakan/core/widgets/button_weidget.dart';
import 'package:sakan/core/widgets/drop_down_form_field_widget.dart.dart';
import 'package:sakan/core/widgets/input_decoration_widget.dart';
import 'package:sakan/features/auth/presentation/pages/register_page.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_bloc.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_state.dart';

class RepaireRequestPage extends StatelessWidget {
  const RepaireRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var repaireController = TextEditingController();
    String unitController = '';
    String roomNumberController = '';
    XFile? attachedImage;
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ServicesBloc, ServicesState>(
      listener: (context, state) {
        if (state is ChooseAttachSuccess) {
          attachedImage = state.attach;
        }
      },
      builder: (context, state) {
        return BlocConsumer<ServicesBloc, ServicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: appBarWidget(text: 'طلب عطل', context: context),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'إضافة طلب',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: MyColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'الرجاء إدخال العلومات التالية : ',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        dropDownButtonFormFieldWidget(
                            isValidate: true,
                            items: items,
                            selectedItem: unitController,
                            labelText: 'اسم الوحدة'),
                        const SizedBox(
                          height: 20,
                        ),
                        dropDownButtonFormFieldWidget(
                            isValidate: true,
                            items: items,
                            selectedItem: roomNumberController,
                            labelText: 'رقم الغرفة'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: 3,
                                maxLength: 200,
                                controller: repaireController,
                                decoration: inputDecorationWidget(
                                    hintText: "وصف العطل لا يمكن أن يكون فارغ",
                                    labelText: 'وصف العطل'),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return validate;
                                  } else if (attachedImage == null) {
                                    return 'يجب عليك إرسال صورة العطل';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ServicesBloc>()
                                    .add(ChooseAttach(attach: attachedImage));
                              },
                              icon: const Icon(Icons.attach_file),
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                        if (attachedImage != null)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              height: 150,
                              child: Image(
                                  image: FileImage(File(attachedImage!.path)),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                       ButtonWeidget(
                            formKey: formKey,
                             title: 'إضافة طلب',
                            onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

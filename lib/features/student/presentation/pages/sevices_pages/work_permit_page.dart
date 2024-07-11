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

class WorkPermitPage extends StatelessWidget {
  const WorkPermitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    String unitController = '';
    XFile? attachedImage;

    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ServicesBloc, ServicesState>(
      listener: (context, state) {
        if (state is ChooseAttachSuccess) {
          attachedImage = state.attach;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWidget(text: 'إذن عمل', context: context),
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
                      'الرجاء إدخال المعلومات التالية :',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dropDownButtonFormFieldWidget(
                        isValidate: true,
                        items: items,
                        labelText: 'اسم الوحدة',
                        selectedItem: unitController),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: addressController,
                            decoration: inputDecorationWidget(
                                hintText: "ادخل عنوان العمل بالتفصيل",
                                labelText: 'عنوان العمل'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              } else if (attachedImage == null) {
                                return 'يجب عليك إرسال صورة إذن العمل';
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
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                    if (attachedImage != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        formKey: formKey, title: 'إضافة طلب', onPressed: () {})
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

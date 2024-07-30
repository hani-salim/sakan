
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/student/presentation/widgets/picture_widget.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/appbar.dart';

import '../../../../../core/widgets/button_weidget.dart';
import '../../../../../core/widgets/drop_down_form_field_widget.dart.dart';
import '../../../../../core/widgets/input_decoration_widget.dart';
import '../../../../auth/presentation/pages/register_page.dart';
import '../../bloc/remote/bloc/student_bloc.dart';
import '../../bloc/remote/bloc/student_state.dart';

class WorkPermitPage extends StatelessWidget {
  const WorkPermitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    String unitController = '';
    var bloc = BlocProvider.of<StudentBloc>(context);

    var formKey = GlobalKey<FormState>();
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {},
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
                              } else if (bloc.attachedPermit == null) {
                                return 'يجب عليك إرسال صورة إذن العمل';
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<StudentBloc>()
                                .add(ChooseAttach(attach: 'workPermit'));
                          },
                          icon: const Icon(Icons.attach_file),
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                    if (bloc.attachedPermit != null)
                      PictureWidget(attachedImage: bloc.attachedPermit,event: ChooseAttach(attach: 'WorkPermit'),),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/student/presentation/widgets/picture_widget.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/appbar.dart';
import '../../../../../core/widgets/button_weidget.dart';
import '../../../../../core/widgets/input_decoration_widget.dart';
import '../../bloc/remote/bloc/student_bloc.dart';
import '../../bloc/remote/bloc/student_state.dart';

class RepaireRequestPage extends StatelessWidget {
  const RepaireRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var repaireController = TextEditingController();
    var bloc = BlocProvider.of<StudentBloc>(context);


    var formKey = GlobalKey<FormState>();
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is ChooseAttachSuccess) {}
      },
      builder: (context, state) {
        return BlocConsumer<StudentBloc, StudentState>(
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
                                  } else if (bloc.attachedRepaire == null) {
                                    return 'يجب عليك إرسال صورة العطل';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<StudentBloc>().add(
                                    ChooseAttach(attach: 'repaireRequest'));
                              },
                              icon: const Icon(Icons.attach_file),
                              color: MyColors.primaryColor,
                            )
                          ],
                        ),
                        if (bloc.attachedRepaire != null)
                          PictureWidget(
                            attachedImage: bloc.attachedRepaire,
                            event: ChooseAttach(attach: 'repaireRequest'),
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

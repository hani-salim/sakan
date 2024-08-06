import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/student_bloc.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/student_state.dart';
import 'package:sakan/features/student/presentation/widgets/attachment_widget.dart';
import 'package:sakan/features/student/presentation/widgets/picture_widget.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/input_decoration_widget.dart';

class SendAttachmentPage extends StatelessWidget {
  const SendAttachmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<StudentBloc>(context);
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return validate;
                    }
                    return null;
                  },
                  value: bloc.registerType,
                  focusColor: Colors.white,
                  decoration: inputDecorationWidget(
                    labelText: 'نوع التسجيل',
                  ),
                  items: ['استمرارية']
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(e),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    bloc.registerType = value;
                    context
                        .read<StudentBloc>()
                        .add(SelectRegisterType(registerType: value!));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                    visible: bloc.registerType == 'استمرارية',
                    child: Column(
                      children: [
                        bloc.attachedfrontId == null
                            ? AttachmentWidget(
                                text: 'صورة هوية وجه أمامي',
                                event: ChooseAttach(attach: 'frontId'),
                              )
                            : PictureWidget(
                                attachedImage: bloc.attachedfrontId, event: ChooseAttach(attach: 'frontId'),
                              ),
                        bloc.attachedBackId == null
                            ? AttachmentWidget(
                                text: 'صورة هوية وجه خلفي',
                                event: ChooseAttach(attach: 'backId'),
                              )
                            : PictureWidget(attachedImage: bloc.attachedBackId, event: ChooseAttach(attach: 'backId'),),
                        bloc.attachedface == null
                            ? AttachmentWidget(
                                text: 'صورة وجه واضحة',
                                event: ChooseAttach(attach: 'face'),
                              )
                            : PictureWidget(attachedImage: bloc.attachedface, event: ChooseAttach(attach: 'face'),),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

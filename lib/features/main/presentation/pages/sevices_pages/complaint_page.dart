import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/colors/colors.dart';

import 'package:sakan/core/widgets/button_weidget.dart';
import 'package:sakan/core/widgets/input_decoration_widget.dart';
import 'package:sakan/features/main/presentation/bloc/remote/bloc/services_bloc.dart';
import 'package:sakan/features/main/presentation/bloc/remote/bloc/services_state.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController complaintController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<ServicesBloc, ServicesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'تقديم شكوى',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    MyColors.primaryColor,
                    MyColors.secondaryColor,
                  ])),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
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
                      'إضافة شكوى',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: MyColors.secondaryColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'الرحاء إدخال الشكوى',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 7,
                      maxLength: 400,
                      controller: complaintController,
                      decoration: inputDecorationWidget(
                          hintText: "الشكوى لا يجب أن تتجاوز ال 400 محرف",
                          radius: 20),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الشكوى لا يجب أن تكون فارغة';
                        } else if (value.length > 400) {
                          return 'الشكوى لا يجب أن تتجاوز ال 400 محرف';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWeidget(
                      formKey: formKey,
                      title: 'إرسال شكوى',
                      onPressed: () {},
                    ),
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


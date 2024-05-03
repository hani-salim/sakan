import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/appbar.dart';
import 'package:sakan/core/widgets/button_box_decoration.dart';
import 'package:sakan/core/widgets/button_style.dart';
import 'package:sakan/core/widgets/drop_down_text_field.dart';
import 'package:sakan/core/widgets/text_input_decoration.dart';
import 'package:sakan/features/main/presentation/widgets/empty_widget.dart';

class BreadRequestPage extends StatelessWidget {
  const BreadRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController quentityController = TextEditingController();
    String? campusController = '';

    return Scaffold(
      key: scaffoldKey,
      appBar: appBarWidget(text: 'تقديم طلب خبز', context: context),
      body: const EmptyWidget(
        title: 'لا يوجد طلبات خبز',
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            scaffoldKey.currentState!.showBottomSheet(
              (context) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible: false,
                          child: LinearProgressIndicator(
                            color: MyColors.primaryColor,
                          ),
                        ),
                        Text(
                          'إضافة طلب',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: MyColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'من فضلك ادخل الكمية المطلوبة',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLength: 1,
                                controller: quentityController,
                                decoration: textInputDecorationWidget(
                                    labelText: "", hintText: ""),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if ((value!.isEmpty) ||
                                      !RegExp(r"^(\d+)*$").hasMatch(value) ||
                                      !(value == '1')) {
                                    return "الكمية غير متوفرة";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '1 ربطة خبز',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.secondaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'من فضلك ادخل مكان السكن',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        dropdownButtonFormFieldWidget(
                          items: ["dl;fsk;lj0", "dsfa", "lhllh"],
                          selectedItem: campusController,
                          labelText: '',
                          validator: (value) {
                            if (value!.isEmpty ||
                                !(value == 'سكن جديد' || value == 'سكن قديم')) {
                              return validate;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: buttonBoxDecorationWidget(),
                          child: ElevatedButton(
                              style: buttonStyleWidget(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child:
                                    // Center(
                                    //   child:
                                    //       CircularProgressIndicator(
                                    //     color: Colors.white,
                                    //   ),
                                    // )
                                    Text(
                                  "إضافة طلب",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {}
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

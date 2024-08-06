import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../../../config/theme/header_widget.dart';
import '../../../../core/widgets/alert_dialog.dart';
import '../../../../core/widgets/button_box_decoration.dart';
import '../../../../core/widgets/button_style.dart';

class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({super.key});

  @override
  createState() => _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState
    extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;
  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height/3;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: headerHeight,
                  child:  HeaderWidget(
                    height: headerHeight,
                    lottieFilePath: "assets/lottieFiles/verification.json",
                    showAnimated: true,
                  )),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'تأكيد الإيميل ',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ادخل كود التفعيل ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            OTPTextField(
                              keyboardType: TextInputType.number,
                              length: 4,
                              width: 300,
                              fieldWidth: 50,
                              style: const TextStyle(fontSize: 30),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              onCompleted: (pin) {
                                setState(() {
                                  _pinSuccess = true;
                                });
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'لم يصلك كود التفعيل',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'إعادة الإرسال',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alertDialogWidget(
                                                "نجاح",
                                                "تم إعادة إرسال كود التفعيل",
                                                context);
                                          },
                                        );
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            Container(
                              decoration: _pinSuccess
                                  ? buttonBoxDecorationWidget()
                                  : buttonBoxDecorationWidget(
                                      color1: Colors.white,
                                      color2: Colors.grey,
                                    ),
                              child: ElevatedButton(
                                style: buttonStyleWidget(),
                                onPressed: _pinSuccess ? () {} : null,
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "تأكيد",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

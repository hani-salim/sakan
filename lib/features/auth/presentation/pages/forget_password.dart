import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/box_decoration.dart';
import 'package:sakan/core/widgets/button_box_decoration.dart';
import 'package:sakan/core/widgets/button_style.dart';
import 'package:sakan/core/widgets/text_input_decoration.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordPage({super.key});

  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: headerHeight,
                  child: HeaderWidget(
                    height: 200,
                    lottieFilePath: "assets/lottieFiles/forgetPassword.json",
                    showAnimated: true,
                  )),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'هل نسيت كلمة المرور',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'رقم الهاتف',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'سوف نرسله إليك',
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: inputBoxDecorationShaddowWidget(),
                              child: TextFormField(
                                controller: phoneController,
                                decoration: textInputDecorationWidget(
                                    labelText: "رقم الهاتف",
                                    hintText: "ادخل رقم الهاتف"),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if ((value!.isEmpty) ||
                                      !RegExp(r"^(\d+)*$").hasMatch(value)) {
                                    return "ادخل رثم هاتف صالح";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            Container(
                              decoration: buttonBoxDecorationWidget(),
                              child: ElevatedButton(
                                style: buttonStyleWidget(),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "إرسال",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context,
                                        forgotPasswwordVerificationPage);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "هل تذكرت كلمة المرور"),
                                  TextSpan(
                                    text: 'تسجيل الدخول',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, loginPage);
                                      },
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/button_weidget.dart';
import '../../../../config/theme/header_widget.dart';
import '../../../../core/widgets/box_decoration.dart';
import '../../../../core/widgets/input_decoration_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordPage({super.key});

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: headerHeight,
                  child: HeaderWidget(
                    height: headerHeight,
                    lottieFilePath: "assets/lottieFiles/forgetPassword.json",
                    showAnimated: true,
                  )),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      const Column(
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
                            'من فضلك ادخل البريد الالكتروني ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'سوف نرسل رمز للتحقق',
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: inputBoxDecorationShaddowWidget(),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: inputDecorationWidget(
                                    labelText: "البريد الالكتروني",
                                    hintText: "ادخل البريد الالكتروني"),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if ((value!.isEmpty) ||
                                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                          .hasMatch(value)) {
                                    return "ادخل إيميل صالح";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            ButtonWeidget(
                              formKey: _formKey,
                                title: 'إرسال',
                                onPressed: () {
                          if (_formKey.currentState!.validate()) {
                                  
                                  Navigator.pushNamed(
                                      context, forgotPasswwordVerificationPage);
                                }}),
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

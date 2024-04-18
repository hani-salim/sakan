import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/box_decoration.dart';
import 'package:sakan/core/widgets/button_box_decoration.dart';
import 'package:sakan/core/widgets/button_style.dart';
import 'package:sakan/core/widgets/text_input_decoration.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_state.dart';
import '../../../../config/theme/header_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var numberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemoteUserBloc, RemoteUserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 250.0,
                    child: HeaderWidget(
                      height: 200,
                      lottieFilePath: "assets/lottieFiles/login.json",
                      showAnimated: true,
                    )),
                SafeArea(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text(
                        'مرحبا',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'قم بتسجيل الدخول إلى حسابك',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: inputBoxDecorationShaddowWidget(),
                              child: TextFormField(
                                controller: emailController,
                                decoration: textInputDecorationWidget(
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
                            const SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              decoration: inputBoxDecorationShaddowWidget(),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !showPassword,
                                decoration: textInputDecorationWidget(
                                  obSecure: true,
                                  showPassword: showPassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                  ),
                                  labelText: 'كلمة المرور',
                                  hintText: 'ادخل كلمة المرور',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'كلمة المرور لا يجب أن تكون فارغة';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              alignment: Alignment.topRight,
                              child: TextButton(
                                  child: Text(
                                    'هل نسيت كلمة المرور',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.apply(color: MyColors.primaryColor),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, forgotPasswordPage);
                                  }),
                            ),
                            Container(
                              decoration: buttonBoxDecorationWidget(),
                              child: ElevatedButton(
                                  style: buttonStyleWidget(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: state is RemoteUserLoadingState
                                        ? Center(
                                            child: CircularProgressIndicator(
                                                color: MyColors.primaryColor),
                                          )
                                        : Text(
                                            'تسجيل الدخول',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                  ),
                                  onPressed: () async {
                                    Navigator.pushNamed(context, homePage);

                                    // DioHelper.postData(url: "login/", data: {
                                    //   "email": "hanisailm870@gmail.com",
                                    //   "password": "12345678"
                                    // }).then((value) {
                                    //   print(
                                    //       "success mohammad ismaiel : $value");
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               Container()));
                                    // }).catchError((errpr) {
                                    //   print("the error is : $errpr");
                                    // });
                                    if (formKey.currentState!.validate()) {}
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text.rich(TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'ليس لديك حساب ؟',
                                  ),
                                  TextSpan(
                                    text: 'إنشاء حساب',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, registerPage);
                                      },
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primaryColor,
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}

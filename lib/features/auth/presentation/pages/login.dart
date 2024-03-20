import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_state.dart';
import '../../../../config/theme/header_widget.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/widgets/widgets.dart';
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
                const SizedBox(
                  height: 250.0,
                  child: HeaderWidget(250.0, true, Icons.login_rounded),
                ),
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
                              decoration: inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: emailController,
                                decoration: textInputDecoration(
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
                              decoration: inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !showPassword,
                                decoration: textInputDecoration(
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
                              decoration: buttonBoxDecoration(context: context),
                              child: ElevatedButton(
                                  style: buttonStyle(),
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
                                    DioHelper.postData(url: "login/", data: {
                                      "email": "hanisailm870@gmail.com",
                                      "password": "12345678"
                                    }).then((value) {
                                      print(
                                          "success mohammad ismaiel : $value");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Container()));
                                    }).catchError((errpr) {
                                      print("the error is : $errpr");
                                    });

                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushNamed(context, homePage);
                                    }
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

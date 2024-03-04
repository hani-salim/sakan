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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var numberController = TextEditingController();
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
                            TextFormField(
                              controller: numberController,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration(
                                  labelText: 'رقم الموبايل',
                                  hintText: 'ادخل رقم الموبايل'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'رقم الهاتف لا يجب أن يكون فارغ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
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
                                        context, forgotPasswordScreen);
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
                                    //
                                    // var headers = {
                                    //   'Content-Type': 'application/json'
                                    // };
                                    // var request = http.Request(
                                    //     'POST',
                                    //     Uri.parse(
                                    //         'http://10.0.2.2:8000/api/login/'));
                                    // request.body =
                                    //     '''{\r\n    "phone":"0999",\r\n    "password":"123"\r\n}''';
                                    // request.headers.addAll(headers);
                                    //
                                    // http.StreamedResponse response =
                                    //     await request.send();
                                    //
                                    // if (response.statusCode == 200) {
                                    //   print(await response.stream
                                    //       .bytesToString());
                                    // } else {
                                    //   print(response.reasonPhrase);
                                    // }

                                    DioHelper.postData(url: "login/", data: {
                                      "phone": "0999",
                                      "password": "123"
                                    }).then((value) {
                                      print(value.data);
                                    }).catchError((errpr) {
                                      print(errpr.toString());
                                    });

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
                                            context, registerScreen);
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

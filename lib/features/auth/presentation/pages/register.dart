import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/widgets.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var idNationalNumberController = TextEditingController();
  var jobController = "طالب أو موظف";
  var typeJobController = "اختر نوع الوظيفة";
  var univercityController = "اختر الجامعة";
  var facultyController = "اختر الكلية";
  var sectionController = "اختر الاختصاص (إن وجد)";
  var campusHousingController = "اختر السكن";
  var unitController = "اختر رقم الوحدة";
  var cityController = "اختر المحافظة";
  var yearController = "اختر السنة الدراسية";
  var passwordController = TextEditingController();

  bool checkboxValue = false;
  bool showPassword = true;
  var profileImage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteUserBloc, RemoteUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const SizedBox(
                  height: 150,
                  child:
                      HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 68.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                if (profileImage != null)
                                  CircleAvatar(
                                    radius: 64,
                                    backgroundImage: FileImage(profileImage),
                                  ),
                                if (profileImage == null)
                                  CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                        255, 129, 128, 128),
                                    radius: 64,
                                    child: Icon(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      Icons.person,
                                      size: 80,
                                    ),
                                  ),
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_sharp,
                                    color: Theme.of(context).primaryColor,
                                    size: 30.0,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'الاسم الأول',
                                hintText: 'ادخل الاسم الأول'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'الاسم الأخير',
                                hintText: 'ادخل الاسم الأخير'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: fatherNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'اسم الأب',
                                hintText: 'ادخل اسم الأب'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: motherNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'اسم و نسبةالأم',
                                hintText: "ادخل اسم و نسبة الأم"),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: phoneController,
                            decoration: textInputDecoration(
                                labelText: "رقم الهاتف",
                                hintText: "ادخل رقم الهاتف"),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if ((value!.isEmpty) ||
                                  !RegExp(r"^(\d+)*$").hasMatch(value)) {
                                return "ادخل رقم صالح";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: idNationalNumberController,
                            decoration: textInputDecoration(
                                labelText: "رقم الهوية الوطني",
                                hintText: "ادخل رقم الهوية الوطني"),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if ((value!.isEmpty) ||
                                  !RegExp(r"^(\d+)*$").hasMatch(value)) {
                                return "ادخل رقم صالح";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                            decoration: inputBoxDecorationShaddow(),
                            child: DropdownButtonFormField(
                              decoration: textInputDecoration(
                                  hintText: "ادخل العمل", labelText: "العمل"),
                              value:jobController,
                              items: [
                                DropdownMenuItem(child: Container(),value: "3",),
                                DropdownMenuItem(child: Container(),value: "3",),
                              ],
                    
                              onChanged: (Object? value) {},
                            )),
                        const SizedBox(height: 20.0),
                        Visibility(
                            visible: jobController == "طالب" ? true : false,
                            child: Column(
                              children: [],
                            )),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: showPassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  }),
                              labelText: 'كلمة المرور',
                              hintText: 'ادخل كلمة المرور',
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                          });
                                        }),
                                    const Text(
                                      "أوافق على كل البنود و الشروط",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'يجب أن توافق على كل البنود و الشروط';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: buttonBoxDecoration(context: context),
                          child: ElevatedButton(
                            style: buttonStyle(),
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: state is RemoteUserLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        "تسجيل".toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

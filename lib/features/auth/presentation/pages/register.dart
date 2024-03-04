import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/widgets.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var unitController = TextEditingController();
  var universityController = TextEditingController();
  var facultyController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nationalController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var campusHousingController = TextEditingController();

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
                                    backgroundColor: const Color.fromARGB(255, 129, 128, 128),
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
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'الاسم', hintText: 'ادخل اسمك'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: nameController,
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
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'النسبة', hintText: "ادخل النسبة"),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: nameController,
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
                            controller: nationalController,
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
                          child: TextFormField(
                            controller: nationalController,
                            decoration: textInputDecoration(
                                labelText: "رقم الهوية ",
                                hintText: "ادخل رقم الهوية"),
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
                            controller: universityController,
                            onTap: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: buttonBoxDecoration(
                                                context: context),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          universityController
                                                                  .text =
                                                              'جامعة تشرين';
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child: const Text(
                                                        'جامعة تشرين',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.none,
                            decoration: textInputDecoration(
                                labelText: 'الجامعة',
                                hintText: 'ادخل اسم الجامعة'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: facultyController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'الكلية',
                                hintText: 'ادخل اسم الكلية'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: facultyController,
                            decoration: textInputDecoration(
                                labelText: 'الاختصاص (إن وجد)',
                                hintText: 'ادخل الاختصاص'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            controller: campusHousingController,
                            onTap: () {
                              setState(() {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => ListView.separated(
                                          itemBuilder: (context, index) =>
                                              options(
                                                  context: context,
                                                  title: '',
                                                  controller:
                                                      campusHousingController),
                                          separatorBuilder: (context, index) =>
                                              const Divider(color: Colors.grey),
                                          itemCount: 3,
                                        ));
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'السكن',
                                hintText: 'اختر سكن قديم أو جديد'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            controller: unitController,
                            onTap: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => ListView.separated(
                                      itemBuilder: (context, index) => options(
                                          context: context,
                                          title: '',
                                          controller: unitController),
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                            color: Colors.grey,
                                          ),
                                      itemCount: 3));
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'رقم الوحدة',
                                hintText: 'ادخل رقم الوحدة'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: addressController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'المحافظة',
                                hintText: 'ادخل اسم المحافظة'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: addressController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return validate;
                              }
                              return null;
                            },
                            decoration: textInputDecoration(
                                labelText: 'السنة الدراسية الحالية',
                                hintText: 'ادخل السنة الدراسية'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
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

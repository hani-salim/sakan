import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/button_weidget.dart';
import '../../../../core/widgets/drop_down_form_field_widget.dart.dart';
import '../bloc/remote/remote_user_event.dart';
import '../../../../config/theme/header_widget.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/box_decoration.dart';
import '../../../../core/widgets/input_decoration_widget.dart';
import '../bloc/remote/remote_user_bloc.dart';
import '../bloc/remote/remote_user_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _idNationalNumberController = TextEditingController();
  String? _jobController;
  String? _typeJobController;
  String? _univercityController;
  String? _facultyController;
  String? _sectionController;

  final TextEditingController _passwordController = TextEditingController();

  bool checkboxValue = false;
  bool showPassword = true;
  XFile? profileImage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteUserBloc, RemoteUserState>(
      listener: (context, state) {
        if(state is ChooseProfielImageSuccess){
          profileImage =state.profileImage;
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                _headerWidget(),
                _body(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Container _body(BuildContext context, RemoteUserState state) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      alignment: Alignment.center,
      child: _form(context, state),
    );
  }

  Form _form(BuildContext context, RemoteUserState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _profileImage(context),
          _sizedBox(),
          _firstName(),
          const SizedBox(height: 20.0),
          _lastName(),
          const SizedBox(height: 20.0),
          _fatherName(),
          const SizedBox(height: 20.0),
          _motherName(),
          const SizedBox(height: 20.0),
          _phoneNumber(),
          const SizedBox(height: 20.0),
          _email(),
          const SizedBox(
            height: 30.0,
          ),
          _idNationNumber(),
          const SizedBox(height: 20.0),
          _studentOrEmployee(),
          const SizedBox(
            height: 20,
          ),
          _ifStudent(),
          _ifEmployee(),
          _password(),
          const SizedBox(height: 15.0),
          _checkBox(context),
          const SizedBox(height: 20.0),
          _registerButton(state),
        ],
      ),
    );
  }

  Visibility _ifStudent() {
    return Visibility(
        visible: _jobController == "طالب" ? true : false,
        child: Column(
          children: [
            _university(),
            const SizedBox(
              height: 20,
            ),
            _faculty(),
            const SizedBox(
              height: 20,
            ),
            _section(),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  ButtonWeidget _registerButton(RemoteUserState state) {
    return ButtonWeidget(title: 'إنشاء حساب', onPressed: (){Navigator.pushNamed(context, homePage);});
  }

  FormField<bool> _checkBox(BuildContext context) {
    return FormField<bool>(
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
                Text.rich(
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: "أوافق على كل البنود و الشروط",
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                state.errorText ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
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
    );
  }

  Container _password() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: showPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon:
                  Icon(showPassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              }),
          labelText: 'كلمة المرور',
          hintText: 'ادخل كلمة المرور',
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(color: Colors.grey.shade400)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
      ),
    );
  }

  Visibility _ifEmployee() {
    return Visibility(
        visible: _jobController == "موظف" ? true : false,
        child: Column(children: [
          dropDownButtonFormFieldWidget(
            isValidate: true,
              items: items,
              selectedItem: _typeJobController,
              labelText: "نوع العمل"),
          const SizedBox(
            height: 20,
          ),
        ]));
  }

  Container _section() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: DropdownButtonFormField(
        decoration: inputDecorationWidget(labelText: "الاختصاص (إن وجد)"),
        value: _sectionController,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(e),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _sectionController = value;
          });
        },
      ),
    );
  }

  Container _faculty() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: DropdownButtonFormField(
        decoration: inputDecorationWidget(labelText: "الكلية"),
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        value: _facultyController,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(e),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _facultyController = value;
          });
        },
      ),
    );
  }

  Container _university() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: DropdownButtonFormField(
        decoration: inputDecorationWidget(labelText: "الجامعة"),
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        value: _univercityController,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(e),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _univercityController = value;
          });
        },
      ),
    );
  }

  Container _studentOrEmployee() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: DropdownButtonFormField(
        decoration: inputDecorationWidget(labelText: "العمل"),
        value: _jobController,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(e),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _jobController = value;
          });
        },
      ),
    );
  }

  Container _idNationNumber() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _idNationalNumberController,
        decoration: inputDecorationWidget(
            labelText: "رقم الهوية الوطني", hintText: "ادخل رقم الهوية الوطني"),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if ((value!.isEmpty) || !RegExp(r"^(\d+)*$").hasMatch(value)) {
            return "ادخل رقم صالح";
          }
          return null;
        },
      ),
    );
  }

  Container _email() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _emailController,
        decoration: inputDecorationWidget(
            labelText: "البريد الالكتروني", hintText: "ادخل البريد الالكتروني"),
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
    );
  }

  Container _phoneNumber() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _phoneController,
        decoration: inputDecorationWidget(
            labelText: "رقم الهاتف", hintText: "ادخل رقم الهاتف"),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if ((value!.isEmpty) || !RegExp(r"^(\d+)*$").hasMatch(value)) {
            return "ادخل رقم صالح";
          }
          return null;
        },
      ),
    );
  }

  Container _motherName() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _motherNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        decoration: inputDecorationWidget(
            labelText: 'اسم و نسبةالأم', hintText: "ادخل اسم و نسبة الأم"),
      ),
    );
  }

  Container _fatherName() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _fatherNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        decoration: inputDecorationWidget(
            labelText: 'اسم الأب', hintText: 'ادخل اسم الأب'),
      ),
    );
  }

  Container _lastName() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _lastNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        decoration: inputDecorationWidget(
            labelText: 'الاسم الأخير', hintText: 'ادخل الاسم الأخير'),
      ),
    );
  }

  Container _firstName() {
    return Container(
      decoration: inputBoxDecorationShaddowWidget(),
      child: TextFormField(
        controller: _firstNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        decoration: inputDecorationWidget(
            labelText: 'الاسم الأول', hintText: 'ادخل الاسم الأول'),
      ),
    );
  }

  SizedBox _sizedBox() {
    return const SizedBox(
      height: 30,
    );
  }

  CircleAvatar _profileImage(BuildContext context) {
    return CircleAvatar(
      radius: 68.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            if (profileImage != null)
              CircleAvatar(
                radius: 64,
                backgroundImage: FileImage(File(profileImage!.path)),
              ),
            if (profileImage == null)
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 129, 128, 128),
                radius: 64,
                child: Icon(
                  color: Theme.of(context).scaffoldBackgroundColor,
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
              onPressed: () {
                context.read<RemoteUserBloc>().add(ChooseProfielImage(profileImage: profileImage));
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _headerWidget() {
    return  SizedBox(height: MediaQuery.of(context).size.height/4, child: HeaderWidget(height: MediaQuery.of(context).size.height/4));
  }
}

List<String> items = ["طالب", "موظف"];

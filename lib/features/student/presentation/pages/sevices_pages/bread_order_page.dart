import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/formatters/formatter.dart';
import 'package:sakan/core/widgets/loading_widget.dart';
import 'package:sakan/features/student/domain/entities/bread_order.dart';
import '../../../../../core/widgets/button_weidget.dart';
import '../../../../../core/widgets/show_toast.dart';
import '../../bloc/remote/bloc/student_bloc.dart';
import '../../bloc/remote/bloc/student_state.dart';
import '../../widgets/bread_order_widget.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/widgets/appbar.dart';

import '../../../../../core/widgets/input_decoration_widget.dart';
import '../../widgets/empty_widget.dart';

class BreadOrderPage extends StatelessWidget {
  const BreadOrderPage({super.key, required this.breadOrderEntities});
  final BreadOrderEntities breadOrderEntities;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController quentityController = TextEditingController();

    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is SubmitABreadOrderSuccessState) {
          showToast(color: Colors.green, msg: 'تم إرسال الطلب بنجاح  ');
                    Navigator.pop(context);
        } else if (state is SubmitABreadOrderLoadingState) {
          const LoadingWidget();
                    Navigator.pop(context);
        }else if (state is SubmitABreadOrderErrorState &&
            state.exception is String) {
          showToast(color: Colors.green, msg: state.exception);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: appBarWidget(text: 'تقديم طلب خبز', context: context),
          body: BlocProvider.of<StudentBloc>(context).isFloatingActionbuttonShow
              ? _empty()
              : BreadOrderWidget(
                  breadOrderEntities: entities,
                ),
          floatingActionButton:
              BlocProvider.of<StudentBloc>(context).isFloatingActionbuttonShow
                  ? _floatingActionButton(
                      scaffoldKey, formKey, quentityController, context, state)
                  : null,
        );
      },
    );
  }

  Padding _floatingActionButton(
      GlobalKey<ScaffoldState> scaffoldKey,
      GlobalKey<FormState> formKey,
      TextEditingController quentityController,
      BuildContext context,
      StudentState state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        splashColor: MyColors.secondaryColor,
        child: BlocProvider.of<StudentBloc>(context).bottomSheetIcon,
        onPressed: () {
          if (!BlocProvider.of<StudentBloc>(context).isShowBottomSheet) {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) =>
                      _form(formKey, quentityController, context, state),
                )
                .closed
                .then((value) {
              context
                  .read<StudentBloc>()
                  .add(const ChangeBottomSheet(isShow: false));
            });
            context
                .read<StudentBloc>()
                .add(const ChangeBottomSheet(isShow: true));
          } else {
            context
                .read<StudentBloc>()
                .add(const ChangeBottomSheet(isShow: false));
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  EmptyWidget _empty() {
    return const EmptyWidget(
      title: 'لا يوجد طلبات خبز',
    );
  }

  SingleChildScrollView _form(
      GlobalKey<FormState> formKey,
      TextEditingController quentityController,
      BuildContext context,
      StudentState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                      decoration:
                          inputDecorationWidget(labelText: "", hintText: ""),
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
                height: 20,
              ),
              _addRequestButton(
                  context: context,
                  controller: quentityController,
                  formKey: formKey,
                  state: state),
            ],
          ),
        ),
      ),
    );
  }

  ButtonWeidget _addRequestButton(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required TextEditingController controller,
      required StudentState state}) {
    return ButtonWeidget(
        formKey: formKey,
        title: 'إضافة طلب',
        onPressed: () {
          if (formKey.currentState!.validate()) {
context.read<StudentBloc>().add(SubmitABreadOrder(phone: user!.phoneNumber.toString(), breadTies: int.parse(controller.text)   )
            );
          }
         
        });
  }
}

BreadOrderEntities entities = BreadOrderEntities(
    breadTies: 1,
    orderNumber: 101,
    role: 100,
    data: Formatter.formatDate(),
    time: '10:40');

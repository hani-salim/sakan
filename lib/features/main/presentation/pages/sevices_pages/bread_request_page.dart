import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/widgets/loading_widget.dart';
import 'package:sakan/core/widgets/show_toast.dart';
import 'package:sakan/features/main/presentation/bloc/local/widget_bloc.dart';
import 'package:sakan/features/main/presentation/widgets/bread_request_widget.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/widgets/appbar.dart';
import '../../../../../core/widgets/button_box_decoration.dart';
import '../../../../../core/widgets/button_style.dart';
import '../../../../../core/widgets/text_input_decoration.dart';
import '../../widgets/empty_widget.dart';

class BreadRequestPage extends StatelessWidget {
  const BreadRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController quentityController = TextEditingController();
   
   
    

    return BlocConsumer<WidgetBloc, WidgetState>(
      listener: (context, state) {
        if (state is AddBreadRequesetSuccessState) {
          showToast(color: Colors.green, msg: 'تم إرسال الطلب بنجاح  ');
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: appBarWidget(text: 'تقديم طلب خبز', context: context),
          body:
              BlocProvider.of<WidgetBloc>(context).isFloatingActionbuttonShow ? _empty() :  BreadRequestCard(role: '1', date: '3/3/2022', time: '10:10 AM',),
          floatingActionButton: BlocProvider.of<WidgetBloc>(context).isFloatingActionbuttonShow
              ? _floatingActionButton( scaffoldKey, formKey,
                  quentityController, context, state)
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
      WidgetState state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        splashColor: MyColors.secondaryColor,
        child: BlocProvider.of<WidgetBloc>(context).bottomSheetIcon,
        onPressed: () {
          if (!BlocProvider.of<WidgetBloc>(context).isShowBottomSheet) {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) =>
                      _form(formKey, quentityController, context, state),
                )
                .closed
                .then((value) {
              context
                  .read<WidgetBloc>()
                  .add(const ChangeBottomSheet(isShow: false));
            });
            context
                .read<WidgetBloc>()
                .add(const ChangeBottomSheet(isShow: true));
          } else {
            context
                .read<WidgetBloc>()
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
      WidgetState state) {
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
                      decoration: textInputDecorationWidget(
                          labelText: "", hintText: ""),
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

  Container _addRequestButton(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required TextEditingController controller,
      required WidgetState state}) {
    return Container(
      decoration: buttonBoxDecorationWidget(),
      child: ElevatedButton(
          style: buttonStyleWidget(),
          child: state is AddBreadRequesetLoadingState
              ? const LoadingWidget()
              : const Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text(
                    "إضافة طلب",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<WidgetBloc>().add(AddBreadRequeset(
                  date: 'date',
                  time: 'time',
                  numberOfBread: controller.toString()));
                  Navigator.pop(context);
            }
          }),
    );
  }
}

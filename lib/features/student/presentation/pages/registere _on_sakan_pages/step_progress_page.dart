import 'package:flutter/cupertino.dart';
import 'package:sakan/core/colors/colors.dart';

class StepProgressPage extends StatefulWidget {
  final double currentStep;
  final double steps;
  const StepProgressPage(
      {super.key, required this.currentStep, required this.steps});

  @override
  State<StepProgressPage> createState() => _StepProgressPageState();
}

class _StepProgressPageState extends State<StepProgressPage> {
  double widthProgress = 0;

  @override
  void initState() {
    onSizeWidget();
    super.initState();
  }

  void onSizeWidget() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size is Size) {
        Size size = context.size!;
        widthProgress = size.width / (widget.steps - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${(widget.currentStep + 1).toInt()} / ${widget.steps.toInt()}')
            ],
          ),
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsetsDirectional.symmetric(vertical: 16),
            decoration: BoxDecoration(
                  color: MyColors.primaryColor.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(8))
                ),
            child: Stack(
              children: [
                AnimatedContainer(
                  width: widthProgress * widget.currentStep,
                  duration:const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8))
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

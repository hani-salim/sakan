import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../features/student/presentation/bloc/local/presentation_bloc.dart';
import '../../core/colors/colors.dart';
import '../../core/constant/constant.dart';

class HeaderWidget extends StatelessWidget {
  final double height;
  final bool? showAnimated;
  final String? lottieFilePath;
  final bool? isMainPage;

  const HeaderWidget({
    required this.height,
    this.showAnimated,
    this.lottieFilePath,
    this.isMainPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<PresentationBloc, PresentationState>(
      listener: (context, state) {},
      builder: (context, state) => Stack(
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: ShapeClipper([
              Offset(width / 5, height),
              Offset(width / 10 * 5, height - 60),
              Offset(width / 5 * 4, height + 20),
              Offset(width, height - 18)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      MyColors.primaryColor.withOpacity(0.4),
                      MyColors.secondaryColor.withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          ClipPath(
            clipper: ShapeClipper([
              Offset(width / 3, height + 20),
              Offset(width / 10 * 8, height - 60),
              Offset(width / 5 * 4, height - 60),
              Offset(width, height - 20)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      MyColors.primaryColor.withOpacity(0.4),
                      MyColors.secondaryColor.withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          ClipPath(
            clipper: ShapeClipper([
              Offset(width / 5, height),
              Offset(width / 2, height - 40),
              Offset(width / 5 * 4, height - 80),
              Offset(width, height - 20)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      MyColors.primaryColor,
                      MyColors.secondaryColor,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          _showAnimated(context, isMainPage),
        ],
      ).animate().slideY(),
    );
  }

  Visibility _showAnimated(BuildContext context, bool? isMainPage) {
    return Visibility(
      visible: showAnimated ?? false,
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                  lottieFilePath ?? 'assets/lottieFiles/sakan.json',
                  width: MediaQuery.of(context).size.width,
                  height: isMainPage ?? false ? height / 2.5 : height - 8),
            ),
            _registerOnSakan(context),
          ],
        ),
      ),
    );
  }

  Visibility _registerOnSakan(BuildContext context) {
    return Visibility(
      visible: user == null
          ? false
          : user!.status == 'غير مسجل في السكن'
              ? true
              : false,
      child: Column(
        children: [
          const Text(
            "يجب التسجيل على السكن للحصول على الخدمات",
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, registerOnSakanDetailesPage);
              },
              child: Text("التسجيل الآن",
                      style: TextStyle(color: Colors.amber[400]))
                  .animate()
                  .shake(duration: const Duration(milliseconds: 10))),
        ],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  // ignore: prefer_final_fields
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

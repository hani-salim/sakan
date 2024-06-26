import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/constant/constant.dart';
import '../../domain/entities/service_item.dart';

class ServiceWidget extends StatefulWidget {
  final ServiceEntities serviceEntities;
  const ServiceWidget({super.key, required this.serviceEntities});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.serviceEntities.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          gradient: widget.serviceEntities.isTapped
              ? LinearGradient(
                  colors: [MyColors.primaryColor, MyColors.secondaryColor])
              : null),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTapDown: (_) =>
                  setTapped(item: widget.serviceEntities, isTapped: true),
              onTapCancel: () =>
                  setTapped(item: widget.serviceEntities, isTapped: false),
              onTapUp: (_) =>
                  setTapped(item: widget.serviceEntities, isTapped: false),
              child: Opacity(
                  opacity: widget.serviceEntities.isTapped ? 0.9 : 1,
                  child: Image(
                    fit: BoxFit.contain,
                    width: double.infinity,
                    image: AssetImage(
                      widget.serviceEntities.url,
                    ),
                  )),
            ),
          ),
          Text(
            widget.serviceEntities.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: !widget.serviceEntities.isTapped
                    ? MyColors.secondaryColor
                    : MyColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void setTapped({required ServiceEntities item, required bool isTapped}) {
    setState(() {
      for (int i = 0; i < services.length; i++) {
        if (item == services[i]) {

          item.isTapped = isTapped;
        if(isTapped){
          switch (item.title) {
            case "طلب الحصول على خبز":
            Navigator.pushNamed(context, breadRequestPage); break;
            case "تقديم إذن عمل":
            Navigator.pushNamed(context, workPermitPage); break;
            case "تقديم شكوى":
            Navigator.pushNamed(context, complaintPage); break;
          case "تقديم طلب صيانة":
            Navigator.pushNamed(context, repaireRequestPage); break;
          
          }
        }
          
        }
      }
      if (item == mainCard) {
        setState(() {
          item.isTapped = isTapped;
        });
      }
    });
  }
}

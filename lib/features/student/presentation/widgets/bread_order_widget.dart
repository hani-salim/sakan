
import 'package:flutter/material.dart';

import 'package:sakan/core/widgets/box_decoration.dart';
import 'package:sakan/core/widgets/button_box_decoration.dart';
import 'package:sakan/features/student/domain/entities/bread_order.dart';

// ignore: must_be_immutable
class BreadOrderWidget extends StatelessWidget {
  BreadOrderEntities breadOrderEntities;
  Function? onTap;
  BreadOrderWidget({
    super.key,
  required this.breadOrderEntities,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  decoration: 
                      buttonBoxDecorationWidget(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'رقم الطلب : ${breadOrderEntities.orderNumber}',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                'يوجد ${breadOrderEntities.role} بطاقة على الدور قبل وصول دوركم',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                breadOrderEntities.data,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Container(
                decoration: inputBoxDecorationShaddowWidget(),
                child:  CircleAvatar(
                  radius: 37,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      breadOrderEntities.time,
                      style:  const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

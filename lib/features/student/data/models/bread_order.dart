import 'package:sakan/core/formatters/formatter.dart';
import 'package:sakan/features/student/domain/entities/bread_order.dart';

class BreadOrderModel extends BreadOrderEntities {
  const BreadOrderModel(
      {required super.breadTies,
      required super.orderNumber,
      required super.role,
      required super.data,
      required super.time});

  factory BreadOrderModel.fromJson(Map<String, dynamic> map) {
    return BreadOrderModel(
        breadTies: map['']??1,
        orderNumber: map['']??1,
        role: map['']??1,
        data: map['']??Formatter.formatDate(),
        time: map['']??'10:50 Am');
  }
}

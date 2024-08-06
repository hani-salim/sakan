import 'package:equatable/equatable.dart';

class BreadOrderEntities extends Equatable {
  final int breadTies;
  final int orderNumber;
  final int role;
  final String data;
  final String time;
  const BreadOrderEntities( 
      {required this.breadTies, required this.orderNumber, required this.role,required this.data,required this.time});

  @override
  List<Object?> get props => [breadTies, orderNumber, role];
}

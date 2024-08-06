import 'package:sakan/features/student/domain/repository/studnet_respository.dart';

class SubmitABreadOrderUseCase{
  final StudentRepository _studentRepository;
  SubmitABreadOrderUseCase(this._studentRepository);
  call({required String phone,required int breadTies}){
  return  _studentRepository.submitABreadOrder(phone: phone, breadTies: breadTies);
  }

}
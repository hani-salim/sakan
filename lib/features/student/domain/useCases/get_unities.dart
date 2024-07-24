import 'package:sakan/features/student/domain/repository/studnet_respository.dart';

class GetUnitiesUseCase {
  final StudnetRepository _studetnRepository;
  GetUnitiesUseCase(this._studetnRepository);
  call({required String university}){
    return _studetnRepository.getUnities(university: university);
  }
}
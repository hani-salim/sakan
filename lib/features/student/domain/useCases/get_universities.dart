import 'package:sakan/features/student/domain/repository/studnet_respository.dart';

class GetUniversitiesUseCase {
  final StudnetRepository _studetnRepository;
  GetUniversitiesUseCase(this._studetnRepository);
  call(){
    return _studetnRepository.getUnversities();
  }
}
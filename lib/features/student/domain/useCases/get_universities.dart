import '../repository/studnet_respository.dart';

class GetUniversitiesUseCase {
  final StudentRepository _studetnRepository;
  GetUniversitiesUseCase(this._studetnRepository);
  call(){
    return _studetnRepository.getUnversities();
  }
}
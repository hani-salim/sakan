import '../repository/studnet_respository.dart';

class GetUnitiesUseCase {
  final StudentRepository _studetnRepository;
  GetUnitiesUseCase(this._studetnRepository);
  call({required String university}){
    return _studetnRepository.getUnities(university: university);
  }
}
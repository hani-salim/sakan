import '../repository/studnet_respository.dart';

class GetRoomsUseCase {
  final StudentRepository _studetnRepository;
  GetRoomsUseCase(this._studetnRepository);
  call({required String university,required String unit}){
    return _studetnRepository.getRooms(university: university, unitName:unit );
  }
}
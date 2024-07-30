import '../repository/studnet_respository.dart';

class GetRoomsUseCase {
  final StudnetRepository _studetnRepository;
  GetRoomsUseCase(this._studetnRepository);
  call({required String university,required String unit}){
    return _studetnRepository.getRooms(university: university, unitName:unit );
  }
}
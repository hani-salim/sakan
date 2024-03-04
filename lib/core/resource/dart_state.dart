import 'package:dio/dio.dart';

abstract class DataState<T>
{
  final T ?  data;

  final DioException ? error;
  
  DataState({this.data , this.error});
}

class DataSuccess<T> extends DataState
{
   DataSuccess(T data) : super(data: data);
}

class DataFailed extends DataState
{
  DataFailed(DioException error) : super(error: error);
}
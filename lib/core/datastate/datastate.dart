import 'package:firebase_auth/firebase_auth.dart';

abstract class DataState<T, E> {
  final T? data;
  final E? exception;
  const DataState({this.data, this.exception});
}

class DataSuccess<T, E> extends DataState<T, E> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T, E> extends DataState<T, E> {
  const DataError(E exception) : super(exception: exception);
}

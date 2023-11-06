import 'package:firebase_auth/firebase_auth.dart';

abstract class DataState<T> {
  final T? data;
  final FirebaseAuthException? exception;
  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(FirebaseAuthException exception) : super(exception: exception);
}

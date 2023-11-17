import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';
import 'package:mlaku_mlaku/features/domain/usecases/geo_usecase.dart';

part 'booking_hotels_event.dart';
part 'booking_hotels_state.dart';

class BookingHotelsBloc extends Bloc<BookingHotelsEvent, BookingHotelsState> {
  BookingHotelsBloc(
    this._getProvUseCase,
    this._getCityUseCase,
  ) : super(BookingHotelsState()) {
    on<BookingStartedEvent>(_onStartEvent);
    on<BookingFirstDesChangedEvent>(_onFirstDesChange);
    on<BookingFirstDateChangedEvent>(_onFirstChange);
    on<BookingSubmittedEvent>(_onSubmitted);
  }

  final GetCityUseCase _getCityUseCase;
  final GetProvUseCase _getProvUseCase;

  FutureOr<void> _onFirstChange(
      BookingFirstDateChangedEvent event, Emitter<BookingHotelsState> emit) {
    print('change first date');
    DateTime firstDate = event.firstDate;

    emit(state.copyWith(firstDate: firstDate));
  }

  FutureOr<void> _onFirstDesChange(
      BookingFirstDesChangedEvent event, Emitter<BookingHotelsState> emit) {
    String? firstDes = event.des;
    bool? isDesValid = event.isDesValid;
    print('change first des');
    emit(state.copyWith(firstDes: firstDes, isDesValid: isDesValid));
  }

  FutureOr<void> _onSubmitted(
      BookingSubmittedEvent event, Emitter<BookingHotelsState> emit) {
    if (state.isValid) {
      print('valid');
    } else {
      print('invalid');
    }
  }

  FutureOr<void> _onStartEvent(
      BookingStartedEvent event, Emitter<BookingHotelsState> emit) async {
    emit(state.copyWith(options: []));
    final dataState = await _getProvUseCase();
    if (dataState is DataSuccess) {
      print('data berhasil');
      emit(state.copyWith(options: dataState.data));
    } else {
      print('data gagal');
      emit(state.copyWith(options: []));
    }
  }
}

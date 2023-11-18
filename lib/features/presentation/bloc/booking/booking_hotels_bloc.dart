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
    on<BookingFirstDateChangedEvent>(_onFirstDateChange);
    on<BookingSubmittedEvent>(_onSubmitted);
  }

  final GetCityUseCase _getCityUseCase;
  final GetProvUseCase _getProvUseCase;

  FutureOr<void> _onStartEvent(
      BookingStartedEvent event, Emitter<BookingHotelsState> emit) async {
    final dataState = await _getProvUseCase();
    if (dataState is DataSuccess) {
      print('data berhasil');
      emit(BookingInitialState(optionsProv: dataState.data!));
      emit(BookingStandbyState());
    } else {
      print('data gagal');
      emit(BookingInitialState(optionsProv: []));
      emit(BookingStandbyState());
    }
  }

  FutureOr<void> _onFirstDesChange(
      BookingFirstDesChangedEvent event, Emitter<BookingHotelsState> emit) {
    String? idFirstDes = event.idDes;
    bool? isFirstDesValid = event.isFirstDesValid;

    print('change first des');
    emit(BookingDesChangedState(optionsCity: [], isFirstDesValid: isFirstDesValid));
    emit(BookingStandbyState());
  }

  FutureOr<void> _onFirstDateChange(
      BookingFirstDateChangedEvent event, Emitter<BookingHotelsState> emit) {
    print('change first date');
    DateTime firstDate = event.firstDate;
    emit(BookingDateChangedState(firstDate: firstDate));
  }

  FutureOr<void> _onSubmitted(
      BookingSubmittedEvent event, Emitter<BookingHotelsState> emit) {
    if (state.isValid) {
      print('valid');
    } else {
      print('invalid');
    }
  }
}

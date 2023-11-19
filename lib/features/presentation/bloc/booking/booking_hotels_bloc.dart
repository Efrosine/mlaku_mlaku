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
  ) : super(const BookingHotelsState()) {
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
      emit(BookingInitialState(optionsProv: dataState.data!));
      emit(BookingStandbyState());
    } else {
      emit(const BookingInitialState(optionsProv: []));
      emit(BookingStandbyState());
    }
  }

  FutureOr<void> _onFirstDesChange(
      BookingFirstDesChangedEvent event, Emitter<BookingHotelsState> emit) async {
    String? idFirstDes = event.idDes;
    bool? isFirstDesValid = event.isFirstDesValid;
    if (isFirstDesValid) {
      final dataState = await _getCityUseCase(params: idFirstDes);
      if (dataState is DataSuccess) {
        emit(BookingDesChangedState(
            optionsCity: dataState.data!, isFirstDesValid: isFirstDesValid));
        emit(BookingStandbyState());
      } else {
        emit(BookingDesChangedState(optionsCity: [], isFirstDesValid: isFirstDesValid));
        emit(BookingStandbyState());
      }
    } else {
      emit(BookingDesChangedState(optionsCity: [], isFirstDesValid: isFirstDesValid));
      emit(BookingStandbyState());
    }
  }

  FutureOr<void> _onFirstDateChange(
      BookingFirstDateChangedEvent event, Emitter<BookingHotelsState> emit) {
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

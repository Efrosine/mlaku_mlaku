import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';
import 'package:mlaku_mlaku/features/domain/entities/req_booking_ent.dart';
import 'package:mlaku_mlaku/features/domain/usecases/booking_hotels_usecase.dart';

import '../../../../core/datastate/datastate.dart';

part 'booking_hotels_event.dart';
part 'booking_hotels_state.dart';

class BookingHotelsBloc extends Bloc<BookingHotelsEvent, BookingHotelsState> {
  BookingHotelsBloc(this._getListHotelsUseCase)
      : super(const BookingHotelsState()) {
    on<BookingFirstDateChangedEvent>(_onFirstDateChange);
    on<BookingFormSubmittedEvent>(_onSubmitted);
  }

  final GetListHotelsUseCase _getListHotelsUseCase;

  FutureOr<void> _onFirstDateChange(
      BookingFirstDateChangedEvent event, Emitter<BookingHotelsState> emit) {
    DateTime firstDate = event.firstDate;
    emit(BookingDateChangedState(firstDate: firstDate));
  }

  FutureOr<void> _onSubmitted(
      BookingFormSubmittedEvent event, Emitter<BookingHotelsState> emit) async {
    var data = await _getListHotelsUseCase(params: event.reqBookingEntity);
    if (data is DataSuccess) {
      emit(BookingNavigateToListState());
      emit(BookingSearchedState(hotelsEntity: data.data!));
    }
  }
}

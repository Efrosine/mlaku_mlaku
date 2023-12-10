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
  BookingHotelsBloc(

    this._getListHotelsUseCase,
    this._getDetailHotelsUseCase,
    this._setReservationUseCase,
    this._getAllReservationUseCase,
  ) : super(const BookingHotelsState()) {
    on<BookingFirstDateChangedEvent>(_onFirstDateChange);
    on<BookingFormSubmittedEvent>(_onSubmitted);
    on<BookingClickedItemEvent>(_onClickItem);
    on<BookingReservationEvent>(_onReservation);
    on<BookingGetAllReservation>(_onGetReservation);
  }

  final GetListHotelsUseCase _getListHotelsUseCase;
  final GetDetailHotelsUseCase _getDetailHotelsUseCase;
  final SetReservationUseCase _setReservationUseCase;
  final GetAllReservationUseCase _getAllReservationUseCase;

  FutureOr<void> _onFirstDateChange(
      BookingFirstDateChangedEvent event, Emitter<BookingHotelsState> emit) {
    DateTime firstDate = event.firstDate;
    emit(BookingDateChangedState(firstDate: firstDate));
  }

  FutureOr<void> _onSubmitted(
      BookingFormSubmittedEvent event, Emitter<BookingHotelsState> emit) async {
    var data = await _getListHotelsUseCase(params: event.reqBookingEntity);

    if (data is DataSuccess) {
      emit(BookingNavigateToNextPage());
      emit(BookingSearchedState(listHotels: data.data));
    }
  }

  FutureOr<void> _onClickItem(
      BookingClickedItemEvent event, Emitter<BookingHotelsState> emit) async {
    var data = await _getDetailHotelsUseCase(params: event.entity);
    if (data is DataSuccess) {
      emit(BookingNavigateToNextPage());
      emit(BookingDetailState(hotelsEntity: data.data));
    }
  }

  FutureOr<void> _onReservation(
      BookingReservationEvent event, Emitter<BookingHotelsState> emit) async {
    print('start getting hotels');
    var data = await _setReservationUseCase(params: event.entity);
    if (data is DataSuccess) {
      emit(BookingNavigateToNextPage());
    }
  }

  FutureOr<void> _onGetReservation(
      BookingGetAllReservation event, Emitter<BookingHotelsState> emit) async {
    var data = await _getAllReservationUseCase();
    if (data is DataSuccess) {
      emit(BookingGetReservationState(listHotels: data.data));

    }
  }
}

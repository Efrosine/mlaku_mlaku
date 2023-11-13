import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_hotels_event.dart';
part 'booking_hotels_state.dart';

class BookingHotelsBloc extends Bloc<BookingHotelsEvent, BookingHotelsState> {
  BookingHotelsBloc() : super(BookingHotelsState()) {
    on<BookingFirstDesChanged>(_onFirstDesChange);
    on<BookingFirstDateChanged>(_onFirstChange);
    on<BookingSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onFirstChange(
      BookingFirstDateChanged event, Emitter<BookingHotelsState> emit) {
    print('change first date');
    DateTime firstDate = event.firstDate;
    emit(state.copyWith(firstDate: firstDate));
  }

  FutureOr<void> _onSubmitted(BookingSubmitted event, Emitter<BookingHotelsState> emit) {
    if (state.isValid) {
      print('valid');
    } else {
      print('invalid');
    }
  }

  FutureOr<void> _onFirstDesChange(
      BookingFirstDesChanged event, Emitter<BookingHotelsState> emit) {
    String? firstDes = event.des;
    bool? isDesValid = event.isDesValid;
    emit(state.copyWith(firstDes: firstDes, isDesValid: isDesValid));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_hotels_event.dart';
part 'booking_hotels_state.dart';

class BookingHotelsBloc extends Bloc<BookingHotelsEvent, BookingHotelsState> {
  BookingHotelsBloc() : super(const BookingHotelsState()) {
    on<BookingFirstDateChangedEvent>(_onFirstDateChange);
    on<BookingFormSubmittedEvent>(_onSubmitted);
  }

  FutureOr<void> _onFirstDateChange(
      BookingFirstDateChangedEvent event, Emitter<BookingHotelsState> emit) {
    DateTime firstDate = event.firstDate;
    emit(BookingDateChangedState(firstDate: firstDate));
  }

  FutureOr<void> _onSubmitted(
      BookingFormSubmittedEvent event, Emitter<BookingHotelsState> emit) {
    if (state.isValid) {
      print('valid');
    } else {
      print('invalid');
    }
  }
}

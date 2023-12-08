part of 'booking_hotels_bloc.dart';

sealed class BookingHotelsEvent extends Equatable {
  const BookingHotelsEvent();

  @override
  List<Object> get props => [];
}

final class BookingFirstDateChangedEvent extends BookingHotelsEvent {
  final DateTime firstDate;
  final bool isFristDateValid;

  const BookingFirstDateChangedEvent(
      {required this.firstDate, required this.isFristDateValid});

  @override
  List<Object> get props => [firstDate];
}

final class BookingFormSubmittedEvent extends BookingHotelsEvent {
  final ReqBookingEntity reqBookingEntity;

  const BookingFormSubmittedEvent({required this.reqBookingEntity});
}

final class BookingClickedItemEvent extends BookingHotelsEvent {}

final class BookingReservationEvent extends BookingHotelsEvent {}

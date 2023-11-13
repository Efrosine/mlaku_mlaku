part of 'booking_hotels_bloc.dart';

sealed class BookingHotelsEvent extends Equatable {
  const BookingHotelsEvent();

  @override
  List<Object> get props => [];
}

final class BookingFirstDateChanged extends BookingHotelsEvent {
  final DateTime firstDate;

  const BookingFirstDateChanged(this.firstDate);

  @override
  List<Object> get props => [firstDate];
}

final class BookingFirstDesChanged extends BookingHotelsEvent {
  final String des;
  final bool isDesValid;

  BookingFirstDesChanged(this.des, this.isDesValid);

  @override
  List<Object> get props => [des, isDesValid];
}

final class BookingSubmitted extends BookingHotelsEvent {
  const BookingSubmitted();
}

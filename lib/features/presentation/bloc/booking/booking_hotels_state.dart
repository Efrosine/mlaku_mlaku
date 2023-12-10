part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState({

    this.firstDate,
    this.isFristDateValid = false,
    this.isValid = false,
    this.listHotels,
    this.hotelsEntity,
  });
  final DateTime? firstDate;

  final bool isFristDateValid, isValid;
  final List<HotelsEntity>? listHotels;
  final HotelsEntity? hotelsEntity;

  @override
  List<Object> get props => [
        isValid,
        firstDate ?? '',
      ];
}

final class BookingDateChangedState extends BookingHotelsState {
  const BookingDateChangedState({required super.firstDate});
}

final class BookingStandbyState extends BookingHotelsState {}

final class BookingNavigateToNextPage extends BookingHotelsState {}

final class BookingSearchedState extends BookingHotelsState {
  const BookingSearchedState({required super.listHotels});
}

final class BookingDetailState extends BookingHotelsState {
  const BookingDetailState({required super.hotelsEntity});
}

final class BookingGetReservationState extends BookingHotelsState {
  const BookingGetReservationState({required super.listHotels});
}


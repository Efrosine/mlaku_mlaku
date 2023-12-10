import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';

import '../../../../injection_container.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('BOOKING PAGE');
    return BlocProvider<BookingHotelsBloc>(
      create: (context) => sl()..add(BookingGetAllReservation()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
        ),
        body: Center(
          child: Text('Saved'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/domain/entities/req_booking_ent.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';

import '../../../../core/const/list.dart';
import '../../../../injection_container.dart';
import '../../bloc/geo/geo_bloc.dart';
import '../../widgets/globalcomponent/comp_custom_carousel.dart';
import '../../widgets/globalcomponent/comp_textfield_datepicker.dart';
import '../../widgets/globalcomponent/comp_textfield_autocomplete.dart';

class BookingHotelsPage extends StatelessWidget {
  const BookingHotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BookingHotelsBloc>.value(
        // create: (context) => sl(),
        value: BlocProvider.of<BookingHotelsBloc>(context),
      ),
      BlocProvider<GeoBloc>(
        create: (context) => sl()..add(GeoStartedEvent()),
      ),
      // ],
      // child: BlocListener(
      //     listener: (context, state) {
      //       if (state is BookingNavigateToListState) {
      //         Navigator.pushNamed(context, '/LHPage');
      //       }
      //     },
      //     child: Scaffold(body: BookingPageContent())));
    ], child: Scaffold(body: BookingPageContent()));
  }
}

class BookingPageContent extends StatelessWidget {
  BookingPageContent({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final _data = ReqBookingEntity.empty();

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingHotelsBloc, BookingHotelsState>(
      listenWhen: (previous, current) => current is BookingNavigateToNextPage,
      listener: (context, state) {
        Navigator.pushNamed(context, '/LHPage');
      },
      child: ListView(
        children: [
          CCaraousel(listData: imageUrl, height: 170),
          Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Location
                    Text(
                      'Destination',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    //prov
                    BlocBuilder<GeoBloc, GeoState>(
                      buildWhen: (previous, current) => current is GeoInitialState,
                      builder: (context, state) {
                        return TextfieldAutocomplete(
                          label: 'Province',
                          isFirstDes: true,
                          options: state.optionsProv ?? [],
                          icons: Icons.home_work_outlined,
                          onSaved: (value) => _data.province = value,
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    //city
                    BlocBuilder<GeoBloc, GeoState>(
                      buildWhen: (previous, current) => current is GeoProvChangedState,
                      builder: (context, state) {
                        return TextfieldAutocomplete(
                          label: 'City',
                          isEnable: state.isProvValid,
                          options: state.optionsCity ?? [],
                          icons: Icons.location_city,
                          onSaved: (value) => _data.city = value,
                        );
                      },
                    ),
                    Divider(height: 24, thickness: 1),

                    //Date
                    Text(
                      'Time',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    //first date
                    TextfieldDatePicker(
                      label: 'Arival',
                      isFirstDate: true,
                      startDate: DateTime.now(),
                      onSaved: (value) => _data.arrivalDate = value,
                    ),
                    SizedBox(height: 16),
                    //second date
                    BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
                      buildWhen: (previous, current) =>
                          current is BookingDateChangedState,
                      builder: (context, state) {
                        return TextfieldDatePicker(
                          label: 'Depature',
                          isEnable: state.firstDate == null ? false : true,
                          startDate: state.firstDate ?? DateTime.now(),
                          onSaved: (value) => _data.departureDate = value,
                        );
                      },
                    ),
                    Divider(height: 24, thickness: 1),

                    //Button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          var state = _formKey.currentState!;
                          if (state.validate()) {
                            state.save();
                            print('save');
                            context
                                .read<BookingHotelsBloc>()
                                .add(BookingFormSubmittedEvent(reqBookingEntity: _data));
                          }
                          // Navigator.pushNamed(context, '/LHPage', arguments: reqBook);
                        },
                        child: Text('Search'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

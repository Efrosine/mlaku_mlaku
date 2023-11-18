import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';

import '../../../../core/const/list.dart';
import '../../../../injection_container.dart';
import '../../widgets/globalcomponent/comp_custom_carousel.dart';
import '../../widgets/globalcomponent/comp_text_field_date.dart';
import '../../widgets/globalcomponent/comp_text_field_search.dart';

class BookingHotelsPage extends StatefulWidget {
  const BookingHotelsPage({super.key});

  @override
  State<BookingHotelsPage> createState() => _BookingHotelsPageState();
}

class _BookingHotelsPageState extends State<BookingHotelsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingHotelsBloc>(
      create: (context) => sl()..add(BookingStartedEvent()),
      child: Scaffold(
        body: BookingPageContent(),
      ),
    );
  }
}

class BookingPageContent extends StatelessWidget {
  BookingPageContent({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CCaraousel(listData: imageUrl, height: 170),
        Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
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
                  BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
                    buildWhen: (previous, current) => current is BookingInitialState,
                    builder: (context, state) {
                      return CTextfiedSearch(
                        label: 'Province',
                        isFirstDes: true,
                        options: state.optionsProv ?? [],
                        icons: Icons.home_work_outlined,
                        onSaved: print,
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  //city
                  BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
                    buildWhen: (previous, current) => current is BookingDesChangedState,
                    builder: (context, state) {
                      return CTextfiedSearch(
                        label: 'City',
                        isEnable: state.isFirstDesValid,
                        options: state.optionsCity ?? [],
                        icons: Icons.location_city,
                        onSaved: print,
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
                  CTextfieldDate(
                    label: 'Arival',
                    isFirstDate: true,
                    startDate: DateTime.now(),
                    onSaved: print,
                  ),
                  SizedBox(height: 16),
                  //second date
                  BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
                    buildWhen: (previous, current) => current is BookingDateChangedState,
                    builder: (context, state) {
                      return CTextfieldDate(
                        label: 'Depature',
                        isEnable: state.firstDate == null ? false : true,
                        startDate: state.firstDate ?? DateTime.now(),
                        onSaved: print,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';

import '../../../../injection_container.dart';
import '../../widgets/globalcomponent/comp_custom_carousel.dart';
import '../../widgets/globalcomponent/comp_text_field_date.dart';
import '../../widgets/globalcomponent/comp_text_field_search.dart';

List<String> imageUrl = [
  'assets/image/promo/promo1.jpg',
  'assets/image/promo/promo2.jpg',
  'assets/image/promo/promo3.jpg',
  'assets/image/promo/promo4.jpg',
];

class BookingHotelsPage extends StatefulWidget {
  const BookingHotelsPage({super.key});

  @override
  State<BookingHotelsPage> createState() => _BookingHotelsPageState();
}

class _BookingHotelsPageState extends State<BookingHotelsPage> {
  List<String> options = ['Malang', 'Surabaya', 'Jakarta', 'Bandung'];

  // Dialog _addGuest(BuildContext context) {
  //   final GuestRoomModel gR = GuestRoomModel();
  //   return Dialog(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //     clipBehavior: Clip.antiAlias,
  //     insetPadding: EdgeInsets.all(16),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         AppBar(
  //           title: Text('Add Guest & Room'),
  //           automaticallyImplyLeading: false,
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(16),
  //           child: Column(
  //             children: [
  //               CounterWidget(
  //                 title: 'Rooms',
  //                 setNumber: (value) => gR.rooms = value,
  //               ),
  //               CounterWidget(
  //                 title: 'Adult',
  //                 setNumber: (value) => gR.adult = value,
  //               ),
  //               CounterWidget(
  //                 title: 'Children',
  //                 setNumber: (value) => gR.children = value,
  //               ),
  //               ElevatedButton(
  //                   onPressed: () => Navigator.pop(context, gR), child: Text('Apply'))
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final control = TextEditingController();
    return BlocProvider<BookingHotelsBloc>(
      create: (context) => sl()..add(BookingStartedEvent()),
      child: Scaffold(
        body: Column(
          children: [
            CCaraousel(listData: imageUrl, height: 170),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                              buildWhen: (previous, current) =>
                                  current is BookingInitialState,
                              builder: (context, state) {
                                return CTextfiedSearch(
                                    isFirstDes: true,
                                    options: state.optionsProv ?? [],
                                    label: 'Province',
                                    icons: Icons.home_work_outlined,
                                    onSaved: print);
                              }),
                          SizedBox(height: 16),
                          //city
                          BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
                            buildWhen: (previous, current) =>
                                current is BookingDesChangedState,
                            builder: (context, state) {
                              return CTextfiedSearch(
                                isEnable: state.isFirstDesValid,
                                options: state.optionsCity ?? [],
                                label: 'City',
                                icons: Icons.location_city,
                                onSaved: (p0) => print(p0),
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
                          CTextfieldDate(
                            isFirstDate: true,
                            label: 'Arival',
                            startDate: DateTime.now(),
                            onSaved: (p0) => print(p0),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
                            buildWhen: (previous, current) =>
                                current is BookingDateChangedState,
                            builder: (context, state) {
                              print(state.firstDate);
                              return CTextfieldDate(
                                label: 'Depature',
                                startDate: state.firstDate ?? DateTime.now(),
                                onSaved: (p0) => print(p0),
                                isEnable: state.firstDate == null ? false : true,
                              );
                            },
                          ),

                          Divider(height: 24, thickness: 1),

                          //Date
                          Text(
                            'Rooms And Guest',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 12),
                          // TextFormField(
                          //   controller:  control,
                          //   onTap: ,
                          // ),
                          //Button
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '/LHPage', arguments: reqBook);
                              },
                              child: Text('Search'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.title,
    required this.setNumber,
  });

  final ValueSetter<int> setNumber;
  final String title;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.setNumber(--value);
                  });
                },
                icon: Icon(Icons.remove)),
            Text(value.toString()),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.setNumber(++value);
                  });
                },
                icon: Icon(Icons.add)),
          ],
        )
      ],
    );
  }
}

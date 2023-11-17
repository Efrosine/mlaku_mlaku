import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/core/extention/string_ex.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';

class CTextfieldDate extends StatelessWidget {
  CTextfieldDate(
      {super.key,
      required this.startDate,
      required this.onSaved,
      required this.label,
      this.onChanged,
      this.isEnable = true});

  final String label;
  final Function(String?) onSaved;
  final Function()? onChanged;
  final DateTime startDate;
  final bool isEnable;

  final controller = TextEditingController();

  final _focusNode = FocusNode();

  _selectDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: startDate,
            firstDate: startDate,
            lastDate: DateTime.now().add(Duration(days: 30)))
        .then((value) {
      if (value != null) {
        print('ok');
        controller.text = value.toHumanString();
        context.read<BookingHotelsBloc>().add(BookingFirstDateChangedEvent(value));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: controller,
      onSaved: onSaved,
      readOnly: true,
      enabled: isEnable,
      onTapOutside: (event) => _focusNode.unfocus(),
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today_outlined),
        suffixIcon: Icon(Icons.arrow_drop_down_rounded),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

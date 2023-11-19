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
      this.isEnable = true,
      this.isFirstDate = false});

  final String label;
  final Function(String? value) onSaved;
  final Function()? onChanged;
  final DateTime startDate;
  final bool isEnable, isFirstDate;

  final _controller = TextEditingController();

  final _focusNode = FocusNode();

  _selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: startDate,
      lastDate: DateTime.now().add(Duration(days: 30)),
    ).then(
      (value) {
        if (value != null) {
          _controller.text = value.toHumanString();
          if (isFirstDate) {
            context.read<BookingHotelsBloc>().add(
                BookingFirstDateChangedEvent(firstDate: value, isFristDateValid: true));
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _controller,
      onSaved: onSaved,
      readOnly: true,
      enabled: isEnable,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Tidak boleh kosong';
        }

        return null;
      },
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

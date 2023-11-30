import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/data/model/geo_model.dart';
import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/geo/geo_bloc.dart';

class TextfieldAutocomplete extends StatelessWidget {
  const TextfieldAutocomplete(
      {super.key,
      required this.options,
      required this.label,
      required this.icons,
      required this.onSaved,
      this.isEnable = true,
      this.isFirstDes = false});

  final IconData icons;
  final String label;
  final Function(String? value) onSaved;
  final List<GeoEntity> options;
  final bool isEnable, isFirstDes;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<GeoEntity>(
      displayStringForOption: (option) => option.name ?? 'not found',
      optionsBuilder: (value) {
        if (value.text.isEmpty) return options;
        return options.where(
            (element) => element.name!.toLowerCase().contains(value.text.toLowerCase()));
      },
      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          enabled: isEnable,
          controller: textEditingController,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              _getFirstDesValidate(isFirstDes, context, value, false);
              return 'Tidak boleh kosong';
            } else if (!options.map((e) => e.name).contains(value)) {
              _getFirstDesValidate(isFirstDes, context, value, false);
              return 'pilihan tidak valid';
            }
            _getFirstDesValidate(isFirstDes, context, value, true);
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(icons),
            suffixIcon: Icon(Icons.arrow_drop_down_rounded),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onTapOutside: (event) => focusNode.unfocus(),
          onSaved: onSaved,
        );
      },
    );
  }

  void _getFirstDesValidate(
      bool isFirstDes, BuildContext context, String? value, bool isValid) {
    if (isFirstDes) {
      String? id = options
          .firstWhere(
            (element) => element.name!.contains(value ?? ''),
            orElse: () => const GeoModel(id: '0', name: 'error'),
          )
          .id;

      context.read<GeoBloc>().add(GeoProvChangedEvent(idProv: id, isProvValid: isValid));
    }
  }
}

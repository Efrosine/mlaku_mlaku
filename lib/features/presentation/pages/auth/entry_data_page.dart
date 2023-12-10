import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/geo/geo_bloc.dart';

import '../../../../injection_container.dart';
import '../../../domain/entities/user_ent.dart';
import '../../widgets/globalcomponent/bunderan.dart';
import '../../widgets/globalcomponent/comp_textfield_autocomplete.dart';
import '../../widgets/globalcomponent/comp_textfield_datepicker.dart';

class EntryDataPage extends StatelessWidget {
  EntryDataPage({super.key, required this.data});
  final _formKey = GlobalKey<FormState>();
  UserEntity data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeoBloc>(
      create: (context) => sl()..add(GeoStartedEvent()),
      child: Container(
        margin: EdgeInsets.fromLTRB(24, 285, 24, 0),
        padding: EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Identitas'),
                  const SizedBox(height: 24),
                  NormalTextField(
                    labelText: "Name",
                    onSaved: (value) => data = data.copyWith(name: value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextfieldDatePicker(
                    startDate: DateTime(1990),
                    onSaved: (value) => data = data.copyWith(birthday: value),
                    label: 'Birthday',
                  ),
                  const SizedBox(height: 24),
                  const Text('Adress'),
                  const SizedBox(height: 24),
                  BlocBuilder<GeoBloc, GeoState>(
                    buildWhen: (previous, current) => current is GeoInitialState,
                    builder: (context, state) {
                      return TextfieldAutocomplete(
                        label: 'Province',
                        isFirstDes: true,
                        options: state.optionsProv ?? [],
                        icons: Icons.home_work_outlined,
                        onSaved: (value) => data = data.copyWith(provience: value),
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
                        onSaved: (value) => data = data.copyWith(city: value),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text('Payment'),
                  const SizedBox(height: 24),
                  NormalTextField(
                    labelText: "No. CC",
                    keyboardType: TextInputType.number,
                    onSaved: (value) => data = data.copyWith(noCc: value),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextfieldDatePicker(
                          startDate: DateTime.now(),
                          onSaved: (value) => data = data.copyWith(validUntil: value),
                          label: 'Valid Until',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: NormalTextField(
                          labelText: "CVV",
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          onSaved: (value) => data = data.copyWith(cvv: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context
                                  .read<AuthBlocBloc>()
                                  .add(AuthBlocEventEntryDataUser(data));
                            }
                          },
                          child: Text('Submit')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NormalTextField extends StatelessWidget {
  NormalTextField(
      {super.key,
      required this.labelText,
      this.onSaved,
      this.keyboardType,
      this.maxLength});

  final _controller = TextEditingController();
  final String labelText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Function(String? value)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tidak Boleh Kosong';
        }
        return null;
      },
    );
  }
}

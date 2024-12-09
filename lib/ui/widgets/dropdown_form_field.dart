// import 'package:flutter/material.dart' as Material show FormField;

import 'package:flutter/material.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.dart';

class DropdownFormField<T> extends FormField<T> {
  DropdownFormField(
      {super.key,
      required this.controller,
      required this.values,
      required this.hintText})
      : super(
          builder: (field) {
            return DropdownMenu(
                hintText: hintText,
                trailingIcon: Icon(Icons.arrow_drop_down),
                inputDecorationTheme: InputDecorationTheme().copyWith(
                  contentPadding: EdgeInsets.zero,
                  // constraints: BoxConstraints.tight(Size(24, 24)),
                ),
                expandedInsets: EdgeInsets.zero,
                dropdownMenuEntries: values
                    .map((element) => DropdownMenuEntry(
                        value: element, label: element.toString()))
                    .toList());
          },
        );

  final String hintText;
  //(fieldState) {

  //   // onSaved: (newValue) {
  //   //   if (newValue != null) {
  //   //     controller.text = newValue.toString();
  //   //   }
  //   // },
  //   builder: (field) => DropdownMenu<T>(
  //       expandedInsets: EdgeInsets.zero,
  //       dropdownMenuEntries: values
  //           .map((element) =>
  //               DropdownMenuEntry(value: element, label: element.toString()))
  //           .toList()),
  // );

  final TextEditingController controller;
  final List<T> values;

  //  Widget _builder(FormFieldState<T> fieldState,) {
  //   return Material.FormField<T>(
  //     onSaved: (newValue) {
  //       if (newValue != null) {
  //         controller.text = newValue.toString();
  //       }
  //     },
  //     builder: (field) => DropdownMenu<T>(
  //         expandedInsets: EdgeInsets.zero,
  //         dropdownMenuEntries: values
  //             .map((element) =>
  //                 DropdownMenuEntry(value: element, label: element.toString()))
  //             .toList()),
  //   );
  // }

  @override
  FormFieldState<T> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends FormFieldState<T> {
  DropdownFormField<T> get _dropdownFormField => widget as DropdownFormField<T>;

  @override
  void didChange(T? value) {
    super.didChange(value);
    _dropdownFormField.onSaved?.call(value);
  }

  // @override
  // void didUpdateWidget(DropdownButtonFormField<T> oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.initialValue != widget.initialValue) {
  //     setValue(widget.initialValue);
  //   }
  // }

  @override
  void reset() {
    super.reset();
    _dropdownFormField.onSaved?.call(value);
  }
}

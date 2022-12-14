import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.hint_txt,
    required this.label_txt,
    required this.validator_txt,
    required this.controller_input,
    required this.type_input,
  }) : super(key: key);

  final String hint_txt;
  final String label_txt;
  final String validator_txt;
  final String type_input;
  final TextEditingController controller_input;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: type_input == 'text'
            ? TextFormField(
                keyboardType: TextInputType.text,
                controller: controller_input,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return validator_txt;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: label_txt,
                  hintText: hint_txt,
                  errorStyle: TextStyle(height: 0.0),
                  // If  you are using latest version of flutter then lable text and hint text shown like this
                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                  ),
                ),
              )
            : TextFormField(
                keyboardType: TextInputType.number,
                controller: controller_input,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return validator_txt;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: label_txt,
                  hintText: hint_txt,
                  errorStyle: const TextStyle(height: 0.0),
                  // If  you are using latest version of flutter then lable text and hint text shown like this
                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                  ),
                ),
              ));
  }
}

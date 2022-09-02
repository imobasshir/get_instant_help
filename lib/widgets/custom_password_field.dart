import 'package:flutter/material.dart';

class CustomPassField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomPassField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  final ValueNotifier<bool> _toogle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _toogle,
      builder: (context, value, child) {
        return TextField(
          controller: controller,
          obscureText: _toogle.value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            suffix: InkWell(
              onTap: () {
                _toogle.value = !_toogle.value;
              },
              child: Icon(
                _toogle.value
                    ? Icons.visibility_off_sharp
                    : Icons.visibility_sharp,
              ),
              
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: const Color(0xffF5F6FA),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}

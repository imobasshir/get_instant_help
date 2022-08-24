import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
    // return ElevatedButton(
    //   onPressed: onTap,
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(Colors.green),
    //     textStyle: MaterialStateProperty.all(
    //       const TextStyle(color: Colors.white),
    //     ),
    //     minimumSize: MaterialStateProperty.all(
    //       Size(MediaQuery.of(context).size.width / 2.5, 50),
    //     ),
    //   ),
    //   child: Text(
    //     text,
    //     style: const TextStyle(color: Colors.white, fontSize: 16),
    //   ),
    // );
  }
}

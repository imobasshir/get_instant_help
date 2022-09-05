import 'package:flutter/material.dart';

class NearMe extends StatefulWidget {
  const NearMe({super.key});

  @override
  State<NearMe> createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Near Me'),
    );
  }
}

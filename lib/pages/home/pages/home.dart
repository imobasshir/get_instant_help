import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/home/pages/guide.dart';
import 'package:get_instant_help/widgets/buttons.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({super.key});

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Button(
            onTap: () {},
            text: 'Call Ambulance',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Button(
            onTap: () {},
            text: 'Instant Help',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        child: ListView(
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
      ),
    );
  }
}

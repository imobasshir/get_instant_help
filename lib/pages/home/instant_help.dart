import 'package:flutter/material.dart';
import 'package:get_instant_help/widgets/big_button.dart';

class InstantHelp extends StatefulWidget {
  const InstantHelp({super.key});

  @override
  State<InstantHelp> createState() => _InstantHelpState();
}

class _InstantHelpState extends State<InstantHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instant Help'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Medical Guide',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BigButton(
                link: Uri.parse('https://youtu.be/gDwt7dD3awc'),
                image: 'assets/heart1.jpg',
                title: 'Heart Attack',
                text: 'In case of heart sttack symptoms what we can do!',
              ),
              const SizedBox(height: 20),
              BigButton(
                link: Uri.parse('https://youtu.be/-NodDRTsV88'),
                image: 'assets/cpr.png',
                title: 'CPR',
                text: 'How to perform CPR',
              ),
              const SizedBox(height: 20),
              BigButton(
                link: Uri.parse('https://youtu.be/NxO5LvgqZe0'),
                image: 'assets/doctor.jpg',
                title: 'Bleeding Wound',
                text: 'How to treat bleeding wound',
              ),
              const SizedBox(height: 20),
              BigButton(
                link: Uri.parse('https://youtu.be/EaJmzB8YgS0'),
                image: 'assets/cross.jpg',
                title: 'Burn Emergency',
                text: 'How to treat burn emergency',
              ),
              const SizedBox(height: 20),
              BigButton(
                link: Uri.parse('https://youtu.be/U0yDJ0udMkg'),
                image: 'assets/cross.jpg',
                title: 'Carry Someone Heavier',
                text: 'How to carry someone heavier',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_instant_help/widgets/big_button.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            'Medical Guide',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 10),
        BigButton(
          title: 'CPR',
          text: 'Perform CPR',
          image:
              'https://github.com/nitashadhingra/MediStat/blob/main/assets/images/a1.jpg?raw=true',
          link: Uri.parse('https://youtu.be/-NodDRTsV88'),
        ),
        const SizedBox(height: 10),
        BigButton(
          title: 'Heart Attack',
          text: 'Heart Attack Emergency',
          image:
              'https://github.com/nitashadhingra/MediStat/blob/main/assets/images/a1.jpg?raw=true',
          link: Uri.parse('https://youtu.be/gDwt7dD3awc'),
        ),
        const SizedBox(height: 10),
        BigButton(
          title: 'Bleeding Wound',
          text: 'How to Treat a Bleeding',
          image:
              'https://github.com/nitashadhingra/MediStat/blob/main/assets/images/a1.jpg?raw=true',
          link: Uri.parse('https://youtu.be/NxO5LvgqZe0'),
        ),
        const SizedBox(height: 10),
        BigButton(
          title: 'Burn Emergency',
          text: 'How to Treat a Burn',
          image:
              'https://github.com/nitashadhingra/MediStat/blob/main/assets/images/a1.jpg?raw=true',
          link: Uri.parse('https://youtu.be/EaJmzB8YgS0'),
        ),
        const SizedBox(height: 10),
        BigButton(
          title: 'Carry Someone Heavier',
          text: 'Move someone to hospital',
          image:
              'https://github.com/nitashadhingra/MediStat/blob/main/assets/images/a1.jpg?raw=true',
          link: Uri.parse('https://youtu.be/U0yDJ0udMkg'),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

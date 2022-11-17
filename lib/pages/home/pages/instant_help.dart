import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/home/instant_help.dart';
import 'package:get_instant_help/pages/home/pages/doctor_src.dart';
import 'package:get_instant_help/widgets/buttons.dart';

class InstantHelpScreen extends StatelessWidget {
  const InstantHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instant Help',
          style: TextStyle(
            fontFamily: 'GoogleSans',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: ListView(
            children: [
              Button(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DoctorScreen();
                      },
                    ),
                  );
                },
                text: 'Call Doctor',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Button(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const InstantHelp();
                      },
                    ),
                  );
                },
                text: 'Medical Guide',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

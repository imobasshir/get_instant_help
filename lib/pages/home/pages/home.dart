import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/home/instant_help.dart';
import 'package:get_instant_help/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({super.key});

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage> {
  @override
  Widget build(BuildContext context) {
    const no = '102';
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        child: ListView(
          children: [
            Button(
              onTap: () async {
                launchUrl(
                  Uri(
                    scheme: 'tel',
                    path: no,
                  ),
                );
              },
              text: 'Call Ambulance',
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
              text: 'Instant Help',
            ),
          ],
        ),
      ),
    );
  }
}

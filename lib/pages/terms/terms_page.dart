import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/terms/terms.dart';

class Terms extends StatelessWidget {
  final List terms = TermsOfUse.termsOfUse;
  Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 32),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Terms of Use",
                    style: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  guidelineList(true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget guidelineList(bool isMentors) {
    return Expanded(
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
          itemCount: terms.length,
          itemBuilder: (context, index) {
            if (isMentors) {
              return Row(
                children: [
                  Column(
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_right,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        terms[index],
                        style: const TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  Column(
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_right,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        terms[index],
                        style: const TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
    required this.link,
  }) : super(key: key);
  final String title;
  final String text;
  final String image;
  final Uri link;

  void urlLaunch(url) {
    launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(
          link,
          mode: LaunchMode.inAppWebView,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ),
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

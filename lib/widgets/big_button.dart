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
      child: Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      onTap: () {
        launchUrl(
          link,
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
          ),
        );
      },
    );
  }
}

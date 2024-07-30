import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaidPage extends StatelessWidget {
  const PaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         PaidWidget(url: 'https://my.syriatel.sy/', urlImage: 'assets/images/syriatel.png',),
         PaidWidget(url: 'https://my.syriatel.sy/', urlImage: 'assets/images/sadade.png',),
      ],
    );
  }
}

class PaidWidget extends StatelessWidget {
  const PaidWidget({
    super.key, this.url, required this.urlImage,
  });
  final String? url;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
         url !=null ? _launchURL(url!):null;
        },
        child: Expanded(child: Image.asset(urlImage)));
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri= Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}

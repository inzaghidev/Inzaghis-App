import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:inzaghi_app/widgets/embedded_web_content.dart';

class InzaghisMedia extends StatelessWidget {
  const InzaghisMedia({super.key});

  static final Uri _mediaUri = Uri.parse(
    'https://sites.google.com/view/inzaghis-sites/pages/inzaghis-media',
  );

  static final List<_SocialNetwork> _networks = [
    _SocialNetwork(
      name: 'Instagram',
      icon: 'assets/icons/instagram-logo.svg',
      account: '@enzapost',
      profile: Uri.parse('https://www.instagram.com/enzapost'),
      description:
          "Sebagai Postingan berbentuk Gambar Persegi dan sebagai Asisten dari Inzaghi's Blog.",
      widgetClass: 'sk-instagram-feed',
      embedId: '25485818',
      widgetPath: 'instagram-feed',
      height: 520,
    ),
    _SocialNetwork(
      name: 'TikTok',
      icon: 'assets/icons/tiktok-logo.svg',
      account: '@enzapostmedia',
      profile: Uri.parse('https://www.tiktok.com/@enzapostmedia'),
      description:
          'Sebagai Postingan berbentuk Video Vertikal (Portrait) yang dapat di-Scrolling seperti Video Tutorial/Tips dan Informasi Singkat.',
      widgetClass: 'sk-tiktok-feed',
      embedId: '25485777',
      widgetPath: 'tiktok-feed',
      height: 600,
    ),
    _SocialNetwork(
      name: 'YouTube',
      icon: 'assets/icons/youtube-logo.svg',
      account: "Inzaghi's Media",
      profile: Uri.parse('https://www.youtube.com/@enzavlogpost'),
      description:
          'Sebagai sebuah Channel yang berbentuk Video seperti Tutorial, Video Shorts, hingga Demo Aplikasi/Project.',
      widgetClass: 'sk-ww-youtube-channel-videos',
      embedId: '25676479',
      widgetPath: 'youtube-channel-videos',
      height: 520,
    ),
    _SocialNetwork(
      name: 'Twitter/X',
      icon: 'assets/icons/x-twitter-logo.svg',
      account: '@InzaTechMedia',
      profile: Uri.parse('https://x.com/InzaTechMedia'),
      description:
          "Sebagai Postingan berbentuk Repost/Retweet, Utasan/Tulisan, hingga Postingan-postingan dari Inzaghi's Blog.",
      widgetClass: 'sk-ww-twitter-feed',
      embedId: '25676338',
      widgetPath: 'twitter-feed',
      height: 520,
    ),
    _SocialNetwork(
      name: 'Threads',
      icon: 'assets/icons/threads-logo.svg',
      account: '@enzapost',
      profile: Uri.parse('https://www.threads.net/@enzapost'),
      description:
          "Sama seperti di X, Sebagai Postingan berbentuk Repost, Utasan/Tulisan, hingga Postingan-postingan dari Instagram dan Inzaghi's Blog.",
      widgetClass: 'sk-ww-threads-posts',
      embedId: '25676359',
      widgetPath: 'threads-posts',
      height: 520,
    ),
  ];

  Future<void> _openLink(BuildContext context, Uri uri) async {
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open this link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inzaghi's Media")),
      backgroundColor: const Color(0xFFFFF1F1),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('📰', style: TextStyle(fontSize: 30)),
                SizedBox(width: 12),
                Flexible(
                  child: Text(
                    "Inzaghi's Media",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFFF7474)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Inzaghi's Media merupakan Platform Layanan untuk Sharing Ilmu, terutama seputar IT. Untuk melihat Halaman ini di Google Sites, silakan lihat di sini:",
                  style: TextStyle(fontSize: 15, height: 1.45),
                ),
                const SizedBox(height: 18),
                _ActionButton(
                  label: 'CLICK HERE',
                  onPressed: () => _openLink(context, _mediaUri),
                ),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Color(0xFF7A8290)),
                const SizedBox(height: 24),
                ..._networks.expand(
                  (network) => [
                    _SocialChannel(
                      network: network,
                      onOpen: (uri) => _openLink(context, uri),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialNetwork {
  const _SocialNetwork({
    required this.name,
    required this.icon,
    required this.account,
    required this.profile,
    required this.description,
    required this.widgetClass,
    required this.embedId,
    required this.widgetPath,
    required this.height,
  });

  final String name;
  final String icon;
  final String account;
  final Uri profile;
  final String description;
  final String widgetClass;
  final String embedId;
  final String widgetPath;
  final double height;
}

class _SocialChannel extends StatelessWidget {
  const _SocialChannel({required this.network, required this.onOpen});

  final _SocialNetwork network;
  final ValueChanged<Uri> onOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 8,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(network.icon, width: 44, height: 44),
                const SizedBox(width: 12),
                Text(
                  network.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF34445C),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () => onOpen(network.profile),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF2864E8),
              ),
              child: Text(network.account),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          network.description,
          style: const TextStyle(
            fontSize: 15,
            height: 1.45,
            color: Color(0xFF34445C),
          ),
        ),
        const SizedBox(height: 18),
        EmbeddedWebContent(
          html: _buildFeedHtml(network),
          height: network.height,
          openExternally: () => onOpen(network.profile),
        ),
      ],
    );
  }

  String _buildFeedHtml(_SocialNetwork network) {
    return '''
<!doctype html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>html, body { margin: 0; padding: 0; overflow-x: hidden; }</style>
  </head>
  <body>
    <div class="${network.widgetClass}" data-embed-id="${network.embedId}"></div>
    <script src="https://widgets.sociablekit.com/${network.widgetPath}/widget.js" async defer></script>
  </body>
</html>
''';
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1B1D21),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}

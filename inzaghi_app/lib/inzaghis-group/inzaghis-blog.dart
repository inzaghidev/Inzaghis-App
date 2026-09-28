import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:inzaghi_app/widgets/embedded_web_content.dart';

class InzaghisBlog extends StatelessWidget {
  const InzaghisBlog({super.key});

  static final Uri _blogUri = Uri.parse(
    'https://sites.google.com/view/inzaghis-sites/pages/inzaghis-blog',
  );
  static final Uri _aggregatorUri = Uri.parse(
    'https://inzaghis-blog-aggregator.vercel.app/',
  );
  static final Uri _legacyUri = Uri.parse('https://inzaghiposuma.blogspot.com');
  static final Uri _teknoBlogUri = Uri.parse('https://enzatech.blogspot.com');
  static final Uri _miniBlogUri = Uri.parse('https://enzashorts.blogspot.com');

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
    const accent = Color(0xFFF0A000);

    return Scaffold(
      appBar: AppBar(title: const Text("Inzaghi's Blog")),
      backgroundColor: const Color(0xFFFFF7F0),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('📝', style: TextStyle(fontSize: 30)),
                SizedBox(width: 12),
                Flexible(
                  child: Text(
                    "Inzaghi's Blog",
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
              border: Border.all(color: accent),
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
                  "Inzaghi's Blog merupakan Platform Blogging sebagai tempat untuk berbagi Ilmu Pengetahuan, terutama seputar IT. Inzaghi's Blog lebih menggunakan Platform Blogger, agar lebih mudah dan praktis. Untuk melihat Halaman ini di Google Sites, silakan lihat di sini:",
                  style: TextStyle(fontSize: 15, height: 1.45),
                ),
                const SizedBox(height: 18),
                _ActionButton(
                  label: 'CLICK HERE',
                  onPressed: () => _openLink(context, _blogUri),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Untuk melihat Inzaghi's Blog Aggregator yang ditarik Data Postingan-nya menggunakan API Blogger, silakan lihat di sini:",
                  style: TextStyle(fontSize: 15, height: 1.45),
                ),
                const SizedBox(height: 14),
                _ActionButton(
                  label: "INZAGHI'S BLOG AGGREGATOR",
                  onPressed: () => _openLink(context, _aggregatorUri),
                ),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Color(0xFF7A8290)),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Inzaghi's Blog (Legacy)",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF34445C),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _openLink(context, _legacyUri),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF2864E8),
                      ),
                      child: const Text('Klik di sini'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Merupakan Blog Lama yang sudah tersedia sejak Tahun 2018, tempat untuk memposting apapun itu.',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: Color(0xFF34445C),
                  ),
                ),
                const SizedBox(height: 18),
                EmbeddedWebContent(
                  uri: _legacyUri,
                  height: 420,
                  openExternally: () => _openLink(context, _legacyUri),
                ),
                const SizedBox(height: 28),
                _BlogSection(
                  title: 'Teknoblog',
                  description:
                      "Merupakan Pindahan dari Blog Lama yang bernama Inzaghi's Blog (Legacy), dan Artikel yang dikhususkan tentang Teknologi.",
                  uri: _teknoBlogUri,
                  onOpen: () => _openLink(context, _teknoBlogUri),
                ),
                const SizedBox(height: 28),
                _BlogSection(
                  title: 'Miniblog',
                  description:
                      'Merupakan Blog khusus Microblogging, terutama untuk menyimpan Postingan Sederhana seperti Kode Program Sederhana, hingga Teks dan Tutorial Singkat.',
                  uri: _miniBlogUri,
                  onOpen: () => _openLink(context, _miniBlogUri),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BlogSection extends StatelessWidget {
  const _BlogSection({
    required this.title,
    required this.description,
    required this.uri,
    required this.onOpen,
  });

  final String title;
  final String description;
  final Uri uri;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF34445C),
                ),
              ),
            ),
            TextButton(
              onPressed: onOpen,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF2864E8),
              ),
              child: const Text('Klik di sini'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15,
            height: 1.45,
            color: Color(0xFF34445C),
          ),
        ),
        const SizedBox(height: 18),
        EmbeddedWebContent(
          uri: uri,
          height: 420,
          openExternally: onOpen,
        ),
      ],
    );
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

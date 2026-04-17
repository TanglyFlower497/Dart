import 'package:finac/presentation/widgets/youtube_video_player.dart';
import 'package:flutter/material.dart';

class JurosPage extends StatelessWidget {
  const JurosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A Magia dos Juros', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Juros: Amigo ou Vilão?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6C63FF)),
            ),
            const SizedBox(height: 16),
            const Text(
              'Os juros podem trabalhar para você (investimentos) ou contra você (dívidas). Entender como eles funcionam é o primeiro passo para a liberdade financeira.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),
            _buildInfoCard(
              title: 'Juros Simples',
              content: 'Calculados apenas sobre o valor inicial. É como uma linha reta que cresce devagar.',
              icon: Icons.linear_scale,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Juros Compostos',
              content: 'Juros sobre juros! O valor cresce de forma exponencial. É a maior força do universo financeiro.',
              icon: Icons.trending_up,
              color: const Color(0xFF00D1B2),
            ),
            const SizedBox(height: 40),
            const Text(
              'Assista e Aprenda',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const YoutubeVideoPlayer(videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'), // Placeholder para vídeo educativo
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(color: Colors.black87, height: 1.4)),
        ],
      ),
    );
  }
}

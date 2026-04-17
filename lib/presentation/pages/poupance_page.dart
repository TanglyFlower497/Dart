import 'package:finac/presentation/widgets/youtube_video_player.dart';
import 'package:flutter/material.dart';

class PoupancaPage extends StatelessWidget {
  const PoupancaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Por que poupar?', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A Importância de Poupar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF00D1B2)),
            ),
            const SizedBox(height: 16),
            const Text(
              'Poupar não é apenas guardar dinheiro, é comprar a sua tranquilidade futura. Descubra por que a reserva de emergência é seu escudo financeiro.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),
            _buildConceptCard(
              title: 'Reserva de Emergência',
              description: 'Um fundo para cobrir imprevistos como uma bicicleta quebrada ou um celular que parou de funcionar.',
              icon: Icons.shield,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            _buildConceptCard(
              title: 'Pague-se Primeiro',
              description: 'Separe sua economia assim que receber seu dinheiro, antes de começar a gastar.',
              icon: Icons.savings,
              color: const Color(0xFF6C63FF),
            ),
            const SizedBox(height: 40),
            const Text(
              'Vídeo: O Hábito de Poupar',
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

  Widget _buildConceptCard({
    required String title,
    required String description,
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
          Text(description, style: const TextStyle(color: Colors.black87, height: 1.4)),
        ],
      ),
    );
  }
}

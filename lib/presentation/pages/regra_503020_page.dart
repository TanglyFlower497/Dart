import 'package:finac/presentation/widgets/youtube_video_player.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Regra503020Page extends StatelessWidget {
  const Regra503020Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A Regra de Ouro: 50/30/20', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'O que é a regra 50/30/20?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6C63FF)),
            ),
            const SizedBox(height: 16),
            const Text(
              'É uma maneira simples e eficaz de dividir seu dinheiro para garantir que você cubra suas necessidades, aproveite a vida e ainda economize para o futuro.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),
            _buildRuleCard(
              percentage: '50%',
              title: 'Necessidades Básicas',
              description: 'Aluguel, contas de luz/água, alimentação e transporte.',
              color: const Color(0xFF6C63FF),
              icon: Icons.home,
            ),
            const SizedBox(height: 16),
            _buildRuleCard(
              percentage: '30%',
              title: 'Desejos Pessoais',
              description: 'Lazer, hobbies, assinaturas e aquela pizza no final de semana.',
              color: const Color(0xFF00D1B2),
              icon: Icons.sports_esports,
            ),
            const SizedBox(height: 16),
            _buildRuleCard(
              percentage: '20%',
              title: 'Dívidas e Investimentos',
              description: 'Pagar dívidas pendentes ou investir para realizar seus sonhos.',
              color: const Color(0xFFFFD700),
              icon: Icons.trending_up,
            ),
            const SizedBox(height: 40),
            const Text(
              'Aprenda em Vídeo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const YoutubeVideoPlayer(videoUrl: 'https://www.youtube.com/watch?v=fXW30XyW8vM'), // Vídeo real sobre a regra
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleCard({
    required String percentage,
    required String title,
    required String description,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Text(
              percentage,
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:finac/presentation/pages/juros_page.dart';
import 'package:finac/presentation/pages/poupance_page.dart';
import 'package:finac/presentation/pages/regra_503020_page.dart';
import 'package:finac/presentation/pages/simulator_page.dart';
import 'package:finac/presentation/viewmodels/finance_viewmodel.dart';
import 'package:finac/presentation/widgets/module_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    _HomeContent(),
    Center(child: Text('Em Breve: Desafios Gamificados')),
    Center(child: Text('Em Breve: Perfil do Investidor')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças na Palma da Mão', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          const CircleAvatar(
            backgroundColor: Color(0xFF00D1B2),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            activeIcon: Icon(Icons.emoji_events),
            label: 'Desafios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF6C63FF),
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SimulatorPage()),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        icon: const Icon(Icons.calculate, color: Colors.white),
        label: const Text('Simular', style: TextStyle(color: Colors.white)),
      )
          : null,
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final financeVM = Provider.of<FinanceViewModel>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBalanceCard(financeVM),
          const SizedBox(height: 24),
          _buildSectionTitle('Módulos Educacionais'),
          const SizedBox(height: 16),
          ModuleCard(
            title: 'A Magia e o Perigo dos Juros',
            description: 'Entenda a diferença entre juros simples e compostos.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const JurosPage())),
          ),
          const SizedBox(height: 12),
          ModuleCard(
            title: 'Por que poupar?',
            description: 'Descubra a importância da reserva de emergência.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PoupancaPage())),
          ),
          const SizedBox(height: 12),
          ModuleCard(
            title: 'A Regra de Ouro: 50/30/20',
            description: 'Aprenda a dividir seu dinheiro de forma eficiente.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Regra503020Page())),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('Metas de Economia'),
          const SizedBox(height: 12),
          _buildGoalsCard(),
          const SizedBox(height: 24),
          _buildSectionTitle('Conquistas Recentes'),
          const SizedBox(height: 12),
          _buildChallengesCard(),
          const SizedBox(height: 80), // Espaço para o FAB
        ],
      ),
    );
  }

  Widget _buildBalanceCard(FinanceViewModel vm) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF8E87FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saldo Disponível',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'R\$ ${vm.balance.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Icon(Icons.account_balance_wallet, size: 48, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildGoalsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Reserva de Emergência', style: TextStyle(fontWeight: FontWeight.w600)),
              Text('60%', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 12),
          LinearPercentIndicator(
            lineHeight: 10.0,
            percent: 0.6,
            progressColor: const Color(0xFF00D1B2),
            backgroundColor: Colors.grey.shade100,
            barRadius: const Radius.circular(10),
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: 8),
          const Text(
            'Faltam R\$ 400,00 para atingir sua meta!',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengesCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.emoji_events, color: Color(0xFFFFD700)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Primeiro Passo', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Você completou seu primeiro simulado!', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

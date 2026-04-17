import 'package:finac/presentation/viewmodels/finance_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({super.key});

  @override
  State<SimulatorPage> createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _essentialController = TextEditingController();
  final TextEditingController _leisureController = TextEditingController();

  @override
  void dispose() {
    _incomeController.dispose();
    _essentialController.dispose();
    _leisureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final financeVM = Provider.of<FinanceViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulador Prático', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Planeje seu Mês',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Insira seus valores para ver quanto você pode investir ou poupar.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildInputField(
              controller: _incomeController,
              label: 'Renda ou Mesada (R\$)',
              icon: Icons.account_balance_wallet,
              onChanged: (val) => financeVM.updateIncome(double.tryParse(val) ?? 0),
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _essentialController,
              label: 'Gastos Essenciais (R\$)',
              icon: Icons.home,
              onChanged: (val) => financeVM.updateEssentialExpenses(double.tryParse(val) ?? 0),
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _leisureController,
              label: 'Gastos com Lazer (R\$)',
              icon: Icons.sports_esports,
              onChanged: (val) => financeVM.updateLeisureExpenses(double.tryParse(val) ?? 0),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF00D1B2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF00D1B2).withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Disponível para Investir',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${financeVM.availableToInvest.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00D1B2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Simulação salva com sucesso!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Salvar Planejamento', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF6C63FF)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 2),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: onChanged,
    );
  }
}

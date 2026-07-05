import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/este_mes.dart';
import '../widgets/este_ano.dart';
import '../widgets/outros_anos.dart';


class DadosTreinoDia {
  List<String> gruposMusculares = [];
  String? horarioInicio;
  String? horarioFim;
  bool concluido = false;
}

class FrequenciaScreen extends StatefulWidget {
  const FrequenciaScreen({super.key});

  @override
  State<FrequenciaScreen> createState() => _FrequenciaScreenState();
}

class _FrequenciaScreenState extends State<FrequenciaScreen> {
  String abaSelecionada = 'Este Mês';

  final Map<String, DadosTreinoDia> _historicoGlobalTreinos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Minha Frequência',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),

            // Botão Seletor de Abas
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade400),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  _buildTabButton('Este Mês'),
                  _buildTabButton('Este Ano'),
                  _buildTabButton('Outros Anos'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: _buildConteudoAba(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String titulo) {
    bool isSelected = abaSelecionada == titulo;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => abaSelecionada = titulo),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: isSelected ? Border.all(color: Colors.black, width: 1.5) : null,
          ),
          child: Text(
            titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConteudoAba() {
    switch (abaSelecionada) {
      case 'Este Mês':
        return EsteMes(
          historico: _historicoGlobalTreinos,
          onAtualizar: () => setState(() {}),
        );
      case 'Este Ano':
        return EsteAno(historico: _historicoGlobalTreinos);
      case 'Outros Anos':

        return OutrosAnos(historico: _historicoGlobalTreinos);
      default:
        return EsteMes(historico: _historicoGlobalTreinos, onAtualizar: () => setState(() {}));
    }
  }
}
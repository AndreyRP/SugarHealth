import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/textos.dart';
import '../widgets/cabecalho.dart';
import '../widgets/este_mes.dart';
import '../widgets/este_ano.dart';
import '../widgets/menuRetratio.dart';
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
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: Color(0xff1AB0A0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
             SizedBox(height: 10),
             TextoTitulos('Minha Frequência'),

             SizedBox(height: 12),

            // Botão Seletor de Abas
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade400),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
        child: Column(
          children: [
            Container(
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
            Container(
              margin: EdgeInsets.only(top: 4),
              height: 2,
              width: 80,
              color: isSelected ? Colors.black : Colors.transparent,
            ),
          ],
        )
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
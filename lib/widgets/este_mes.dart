import 'package:flutter/material.dart';
import '../pages/frequencia_screen.dart';
import 'selecao_treino.dart';
import 'registro_treino.dart';

class EsteMes extends StatefulWidget {
  final Map<String, DadosTreinoDia> historico;
  final VoidCallback onAtualizar;

  const EsteMes({
    super.key,
    required this.historico,
    required this.onAtualizar
  });

  @override
  State<EsteMes> createState() => _EsteMesState();
}

class _EsteMesState extends State<EsteMes> {
  DateTime _dataFoco = DateTime(2026, 2, 1);
  int _diaSelecionadoAtual = 0;
  int _estadoModal = 0;

  final List<String> _nomesMeses = [
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
  ];

  void _mudarMes(int mudanca) {
    setState(() {
      _dataFoco = DateTime(_dataFoco.year, _dataFoco.month + mudanca, 1);
      _estadoModal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int diasNoMes = DateTime(_dataFoco.year, _dataFoco.month + 1, 0).day;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFD4F4F0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        '${_nomesMeses[_dataFoco.month - 1]} de ${_dataFoco.year}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.chevron_left, size: 20), onPressed: () => _mudarMes(-1)),
                      IconButton(icon: const Icon(Icons.chevron_right, size: 20), onPressed: () => _mudarMes(1)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('S', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text('D', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text('S', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text('T', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text('Q', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text('Q', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text('S', style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: diasNoMes,
                  itemBuilder: (context, index) {
                    int dia = index + 1;
                    String chaveDia = "${_dataFoco.year}-${_dataFoco.month}-$dia";

                    bool temTreinoSalvo = widget.historico.containsKey(chaveDia) &&
                        widget.historico[chaveDia]!.concluido;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _diaSelecionadoAtual = dia;
                          _estadoModal = temTreinoSalvo ? 3 : 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black54),
                          color: temTreinoSalvo ? const Color(0xFF00A88F) : Colors.transparent,
                        ),
                        child: Text(
                          dia.toString().padLeft(2, '0'),
                          style: TextStyle(
                            fontSize: 12,
                            color: temTreinoSalvo ? Colors.white : Colors.black87,
                            fontWeight: temTreinoSalvo ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          if (_estadoModal == 1)
            SelecaoTreino(
              onAvancar: (listaMusculos) {
                setState(() {
                  String chaveDia = "${_dataFoco.year}-${_dataFoco.month}-$_diaSelecionadoAtual";
                  if (listaMusculos.isEmpty) {
                    widget.historico.remove(chaveDia);
                    _estadoModal = 0;
                  } else {
                    widget.historico[chaveDia] = DadosTreinoDia()..gruposMusculares = listaMusculos;
                    _estadoModal = 2;
                  }
                });
                widget.onAtualizar();
              },
              onFechar: () => setState(() => _estadoModal = 0),
            ),

          if (_estadoModal == 2)
            RegistroTreino(
              isPreenchido: false,
              tituloDia: "$_diaSelecionadoAtual de ${_nomesMeses[_dataFoco.month - 1]} de ${_dataFoco.year}",
              onSalvarHorarios: (inicio, fim) {
                setState(() {
                  String chaveDia = "${_dataFoco.year}-${_dataFoco.month}-$_diaSelecionadoAtual";
                  if (widget.historico.containsKey(chaveDia)) {
                    widget.historico[chaveDia]!.horarioInicio = inicio;
                    widget.historico[chaveDia]!.horarioFim = fim;
                    widget.historico[chaveDia]!.concluido = true;
                  }
                  _estadoModal = 0;
                });
                widget.onAtualizar();
              },
              onFechar: () => setState(() => _estadoModal = 0),
            ),

          if (_estadoModal == 3)
            _buildResumoOuDesmarcarDia(),
        ],
      ),
    );
  }

  Widget _buildResumoOuDesmarcarDia() {
    String chaveDia = "${_dataFoco.year}-${_dataFoco.month}-$_diaSelecionadoAtual";
    DadosTreinoDia dados = widget.historico[chaveDia]!;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$_diaSelecionadoAtual de ${_nomesMeses[_dataFoco.month - 1]} de ${_dataFoco.year}",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text('Exercício realizado: ${dados.gruposMusculares.join(', ')}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.check_circle, color: Color(0xFF00A88F), size: 16),
              const SizedBox(width: 8),
              Text('Início às ${dados.horarioInicio}', style: const TextStyle(color: Colors.white, fontSize: 12)),
            ]),
            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.check_circle, color: Color(0xFF00A88F), size: 16),
              const SizedBox(width: 8),
              Text('Fim às ${dados.horarioFim}', style: const TextStyle(color: Colors.white, fontSize: 12)),
            ]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.historico.remove(chaveDia);
                      _estadoModal = 0;
                    });
                    widget.onAtualizar();
                  },
                  child: const Text('Desmarcar Dia', style: TextStyle(color: Colors.redAccent)),
                ),
                TextButton(onPressed: () => setState(() => _estadoModal = 0), child: const Text('Fechar', style: TextStyle(color: Color(0xFF00A88F)))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
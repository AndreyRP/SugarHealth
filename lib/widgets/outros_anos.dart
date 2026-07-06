import 'package:flutter/material.dart';
import '../pages/frequencia_screen.dart';

class OutrosAnos extends StatefulWidget {
  final Map<String, DadosTreinoDia> historico;

  const OutrosAnos({super.key, required this.historico});

  @override
  State<OutrosAnos> createState() => _OutrosAnosState();
}

class _OutrosAnosState extends State<OutrosAnos> {
  bool _mostrandoDetalhesAno = false;
  String _anoSelecionado = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: _mostrandoDetalhesAno ? _buildTelaVerificacaoAno() : _buildListaAnos(),
    );
  }

  Widget _buildListaAnos() {
    final List<String> anos = ['2026', '2025', '2024', '2023'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Anos anteriores', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Text('Selecione um ano', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: anos.length,
            itemBuilder: (context, index) {
              String ano = anos[index];

              int totalTreinosAno = widget.historico.keys.where((chave) => chave.startsWith("$ano-")).length;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _anoSelecionado = ano;
                    _mostrandoDetalhesAno = true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ano, style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'serif')),
                      Text(
                        '$totalTreinosAno treinos registrados',
                        style: TextStyle(color: totalTreinosAno > 0 ? const Color(0xFF00A88F) : Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTelaVerificacaoAno() {
    int treinosDoAno = widget.historico.keys.where((chave) => chave.startsWith("$_anoSelecionado-")).length;

    if (treinosDoAno > 0) {
      return Column(
        children: [
          Text('Resumo de $_anoSelecionado', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: widget.historico.keys.where((k) => k.startsWith("$_anoSelecionado-")).map((chave) {
                var treino = widget.historico[chave]!;
                return ListTile(
                  title: Text('Dia ${chave.split('-')[2]}/${chave.split('-')[1]}'),
                  subtitle: Text('${treino.gruposMusculares.join(', ')} (${treino.horarioInicio} - ${treino.horarioFim})'),
                  leading: const Icon(Icons.fitness_center, color: Color(0xFF00A88F)),
                );
              }).toList(),
            ),
          ),
          TextButton(onPressed: () => setState(() => _mostrandoDetalhesAno = false), child: const Text('Voltar'))
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text('Janeiro de $_anoSelecionado', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
              Row(
                children: [
                  IconButton(icon: const Icon(Icons.chevron_left, size: 18), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.chevron_right, size: 18), onPressed: () {}),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.notifications_none_outlined, size: 48, color: Colors.redAccent),
          const SizedBox(height: 16),
          const Text('Não há frequência neste período', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Ter uma rotina de treinos é fundamental para o seu resultado',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => setState(() => _mostrandoDetalhesAno = false),
            child: const Text('Voltar para lista de anos', style: TextStyle(color: Color(0xFF00A88F))),
          )
        ],
      );
    }
  }
}
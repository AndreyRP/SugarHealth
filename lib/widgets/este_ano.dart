import 'package:flutter/material.dart';
import '../screens/frequencia_screen.dart';

class EsteAno extends StatelessWidget {
  final Map<String, DadosTreinoDia> historico;

  const EsteAno({super.key, required this.historico});

  @override
  Widget build(BuildContext context) {
    final List<String> meses = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Sua frequência anual:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text('Selecione um mês', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              itemCount: meses.length,
              itemBuilder: (context, index) {
                int numeroMes = index + 1;

                int treinosNoMes = historico.keys.where((chave) {
                  return chave.startsWith("2026-$numeroMes-") && historico[chave]!.concluido;
                }).length;

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        meses[index],
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '$treinosNoMes treinos',
                        style: TextStyle(
                            color: treinosNoMes > 0 ? const Color(0xFF00A88F) : Colors.white54,
                            fontSize: 11,
                            fontWeight: treinosNoMes > 0 ? FontWeight.bold : FontWeight.normal
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('2026', style: TextStyle(color: Colors.white38, fontSize: 9)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
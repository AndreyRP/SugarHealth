import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/exercicios.dart';
import '../widgets/buildBox.dart';
import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';

class TelaExercicios extends StatefulWidget {
  final CategoriaTreino categoria;
  final Color tealColor;

  const TelaExercicios({
    super.key,
    required this.categoria,
    required this.tealColor,
  });

  @override
  State<TelaExercicios> createState() => _TelaExerciciosState();
}

class _TelaExerciciosState extends State<TelaExercicios> {

  void _verificarConclusao() {
    bool todosConcluidos = widget.categoria.exercicios.every((e) => e.concluido);

    if (todosConcluidos) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("🔥 Parabéns!", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text(
              "Seu treino de ${widget.categoria.nome} foi finalizado com sucesso!",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text("Voltar ao Início", style: TextStyle(color: widget.tealColor, fontWeight: FontWeight.bold)),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: Color(0xFF14A38B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 0, top: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black, fontWeight: .bold,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Nível de Risco: Baixo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: widget.tealColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.categoria.nome,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.categoria.exercicios.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final exercicio = widget.categoria.exercicios[index];

                        return Row(
                          crossAxisAlignment: exercicio.expandido ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: exercicio.expandido ? 12.0 : 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    exercicio.concluido = !exercicio.concluido;
                                    exercicio.expandido = !exercicio.concluido;
                                  });
                                  _verificarConclusao();
                                },
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black54, width: 2),
                                    borderRadius: BorderRadius.circular(4),
                                    color: exercicio.concluido ? widget.tealColor : Colors.transparent,
                                  ),
                                  child: exercicio.concluido
                                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    exercicio.expandido = !exercicio.expandido;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: widget.tealColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            exercicio.nome,
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                          ),
                                          const Icon(Icons.sync, size: 18, color: Colors.black87),
                                        ],
                                      ),
                                      if (exercicio.expandido) ...[
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(child: buildInfoCapsule("${exercicio.series}\nSéries")),
                                            const SizedBox(width: 8),
                                            Expanded(child: buildInfoCapsule("${exercicio.repeticoes}\nRepetições")),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        buildInfoCapsule(exercicio.carga),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
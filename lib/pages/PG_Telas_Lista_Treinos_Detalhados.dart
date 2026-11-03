import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/textos.dart';

import '../classes/exercicios.dart';
import '../widgets/cabecalho.dart';
import '../widgets/createBoxInput.dart';
import '../widgets/inputDecoration.dart';
import '../widgets/menuRetratio.dart';

class PG_Exercicius_Detalhados extends StatefulWidget {
  final CategoriaTreinoDetalhado categoria;
  final Color tealColor;

  const PG_Exercicius_Detalhados({
    super.key,
    required this.categoria,
    required this.tealColor,
  });

  @override
  State<PG_Exercicius_Detalhados> createState() => _PG_Exercicius_DetalhadosState();
}

class _PG_Exercicius_DetalhadosState extends State<PG_Exercicius_Detalhados> {

  final TextEditingController _repeticoes = TextEditingController();
  final TextEditingController _carga = TextEditingController();

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
                      child: TextoPadraoBold(widget.categoria.nome),
                    ),
                    SizedBox(height: 16),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.categoria.exercicios.length,
                      separatorBuilder: (context, index) => SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final exercicio = widget.categoria.exercicios[index];

                        // Controladores específicos para este item da lista
                        final TextEditingController repController = TextEditingController();
                        final TextEditingController cargaController = TextEditingController();

                        if(exercicio.nome == 'Descanso'){
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                            decoration: BoxDecoration(
                              color: widget.tealColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextoPadraoBold("Descanso")
                          );
                        };
                        
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

                            SizedBox(width: 12),

                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    exercicio.expandido = !exercicio.expandido;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                                          TextoTituloTreino(exercicio.nome),
                                          Icon(Icons.sync, size: 18, color: Colors.black87),
                                        ],
                                      ),
                                      if (exercicio.expandido) ...[
                                        SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(child: _buildInfoCapsule("${exercicio.seriesCadastradas}\nSéries")),
                                            SizedBox(width: 8),
                                            Expanded(child: _buildInfoCapsule("${exercicio.repeticoesCadastradas}\nRepetições")),
                                          ],
                                        ),

                                        SizedBox(height: 8),

                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: BuildInputContainer(
                                                  child: TextField(
                                                    controller: repController, // Usa o controller local
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputStyles.BuildInputDecorationTreino('Repetições'),
                                                  ),
                                                )),

                                            SizedBox(width: 6),

                                            Expanded(
                                                flex: 1,
                                                child: BuildInputContainer(
                                                  child: TextField(
                                                    controller: cargaController, // Usa o controller local
                                                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                    decoration: InputStyles.BuildInputDecorationTreino('Carga'),
                                                  ),
                                                )),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.add, size: 24, color: Colors.black),
                                              onPressed: () {
                                                _adicionarSerie(index, repController, cargaController);
                                              },
                                            ),
                                          ],
                                        ),

                                        // Renderiza as séries adicionadas com segurança caso a lista seja null
                                        if (exercicio.series != null)
                                          ...List.generate(exercicio.series!.length, (indexSerie) {
                                            final serieItem = exercicio.series![indexSerie];

                                            if (serieItem.repeticoes == null && serieItem.cargaUsada == null) {
                                              return const SizedBox.shrink();
                                            }

                                            return Dismissible(
                                              key: Key('serie_${index}_$indexSerie'), // Chave única combinando o exercício e o índice da série
                                              direction: DismissDirection.endToStart,
                                              background: Container(
                                                margin: const EdgeInsets.only(top: 6.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.redAccent,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                alignment: Alignment.centerRight,
                                                padding: const EdgeInsets.only(right: 20),
                                                child: const Icon(Icons.delete, color: Colors.white),
                                              ),
                                              onDismissed: (direction) {
                                                // Remove a série da lista dentro de um setState para atualizar a tela
                                                setState(() {
                                                  exercicio.series!.removeAt(indexSerie);
                                                });

                                                late OverlayEntry overlayEntry;

                                                overlayEntry = OverlayEntry(
                                                  builder: (context) => Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    right: 0,
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                                        decoration: BoxDecoration(
                                                          color: Colors.black87,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Colors.black26,
                                                              blurRadius: 10,
                                                              offset: Offset(0, 5),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            const Icon(Icons.delete_outline, color: Colors.white, size: 20),
                                                            const SizedBox(width: 12),
                                                            Expanded(
                                                              child: Text(
                                                                'Série ${indexSerie + 1} removida.',
                                                                style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );

                                                // Insere a mensagem na camada superior do Flutter
                                                Overlay.of(context).insert(overlayEntry);

                                                // Remove o aviso da tela automaticamente após 2 segundos
                                                Future.delayed(const Duration(seconds: 2), () {
                                                  overlayEntry.remove();
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 6.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(child: _buildInfoCapsule("${serieItem.repeticoes} Rep")),
                                                    const SizedBox(width: 8),
                                                    Expanded(child: _buildInfoCapsule("${serieItem.cargaUsada} Kg")),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
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

  Widget _buildInfoCapsule(String texto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  _adicionarSerie(int index, TextEditingController repController, TextEditingController cargaController) {
    int repeticao = int.tryParse(repController.text) ?? 0;
    double carga = double.tryParse(cargaController.text) ?? 0.0;

    final exercicio = widget.categoria.exercicios[index];

    // Como 'series' nunca é null, podemos calcular o tamanho diretamente
    int proximaSerie = exercicio.series!.length + 1;

    setState(() {
      // Adiciona diretamente sem precisar de validações de null
      exercicio.series?.add(Series(series: proximaSerie, repeticoes: repeticao, cargaUsada: carga));
      repController.clear();
      cargaController.clear();
    });
  }
}

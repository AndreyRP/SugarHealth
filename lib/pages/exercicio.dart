import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/cabecalho.dart';

void main() {
  runApp(const SuggarHealthApp());
}

class SuggarHealthApp extends StatelessWidget {
  const SuggarHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color tealColor = const Color(0xFF14A38B);

    return MaterialApp(
      title: 'SuggarHealth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: tealColor,
        scaffoldBackgroundColor: tealColor,
        fontFamily: 'sans-serif',
      ),
      home: TelaCategorias(),
    );
  }
}

class Exercicio {
  final String nome;
  final int series;
  final int repeticoes;
  final String carga;
  bool concluido;
  bool expandido;

  Exercicio({
    required this.nome,
    this.series = 3,
    this.repeticoes = 12,
    this.carga = "Carga Moderada",
    this.concluido = false,
    this.expandido = true,
  });
}

class CategoriaTreino {
  final String nome;
  final List<Exercicio> exercicios;

  CategoriaTreino({required this.nome, required this.exercicios});
}

class TelaCategorias extends StatelessWidget {

  TelaCategorias({super.key});
  final List<CategoriaTreino> treinos = [
    CategoriaTreino(nome: "Costas", exercicios: [
      Exercicio(nome: "Puxador Alto Aberto"),
      Exercicio(nome: "Remada Curvada"),
      Exercicio(nome: "Levantamento Terra"),
      Exercicio(nome: "Remada Sentada"),
    ]),
    CategoriaTreino(nome: "Perna", exercicios: [
      Exercicio(nome: "Agachamento Livre"),
      Exercicio(nome: "Leg Press 45°"),
      Exercicio(nome: "Cadeira Extensora"),
    ]),
    CategoriaTreino(nome: "Ombro", exercicios: [
      Exercicio(nome: "Desenvolvimento Halteres"),
      Exercicio(nome: "Elevação Lateral"),
    ]),
    CategoriaTreino(nome: "Triceps", exercicios: [
      Exercicio(nome: "Tríceps Pulley"),
      Exercicio(nome: "Tríceps Testa"),
    ]),
    CategoriaTreino(nome: "Bíceps", exercicios: [
      Exercicio(nome: "Rosca Direta"),
      Exercicio(nome: "Rosca Alternada"),
    ]),
    CategoriaTreino(nome: "Peito", exercicios: [
      Exercicio(nome: "Supino Reto"),
      Exercicio(nome: "Crucifixo Inclinado"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14A38B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Cabecalho(),
              SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
                      child: const Text(
                        'Treino',
                        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: treinos.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 22),
                        itemBuilder: (context, index) {
                          final treino = treinos[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TelaExercicios(
                                    categoria: treino,
                                    tealColor: Color(0xFF14A38B),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 55,
                              padding: const EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFF14A38B),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                treino.nome,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    SizedBox(height: 10,)
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

class TelaExercicios extends StatefulWidget {
  final CategoriaTreino categoria;
  final Color tealColor;

  const TelaExercicios({super.key, required this.categoria, required this.tealColor});

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
      backgroundColor: const Color(0xFF14A38B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Cabecalho(),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.all(16),
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
                                            Expanded(child: _buildInfoCapsule("${exercicio.series}\nSéries")),
                                            const SizedBox(width: 8),
                                            Expanded(child: _buildInfoCapsule("${exercicio.repeticoes}\nRepetições")),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        _buildInfoCapsule(exercicio.carga),
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
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
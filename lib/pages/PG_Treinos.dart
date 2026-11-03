import 'package:flutter/material.dart';
import 'package:sugarhealth/pages/PG_Cadastro_Treino.dart';
import 'package:sugarhealth/pages/PG_Telas_Lista_Treinos_Detalhados.dart';
import 'package:sugarhealth/widgets/cabecalho.dart';
import '../classes/exercicios.dart';
import '../widgets/menuRetratio.dart';
import 'PG_Telas_Lista_Treinos.dart';

class PgTreinos extends StatefulWidget {
  const PgTreinos({super.key});

  @override
  State<PgTreinos> createState() => _PgTreinosState();
}

class _PgTreinosState extends State<PgTreinos> {

  final List<CategoriaTreino> treinos = [
    CategoriaTreino(nome: "Costas", exercicios: [
      Exercicio(nome: "Puxador Alto Aberto", series: 4, repeticoes: 10),
      Exercicio(nome: "Remada Curvada", series: 4, repeticoes: 8),
      Exercicio(nome: "Levantamento Terra", series: 3, repeticoes: 8),
      Exercicio(nome: "Remada Sentada", series: 3, repeticoes: 12),
    ]),
    CategoriaTreino(nome: "Perna", exercicios: [
      Exercicio(nome: "Agachamento Livre", series: 4, repeticoes: 8),
      Exercicio(nome: "Leg Press 45°", series: 3, repeticoes: 12),
      Exercicio(nome: "Cadeira Extensora", series: 3, repeticoes: 20),
    ]),
    CategoriaTreino(nome: "Ombro", exercicios: [
      Exercicio(nome: "Desenvolvimento Halteres", series: 4, repeticoes: 10),
      Exercicio(nome: "Elevação Lateral", series: 3, repeticoes: 20),
    ]),
    CategoriaTreino(nome: "Triceps", exercicios: [
      Exercicio(nome: "Tríceps Pulley", series: 3, repeticoes: 12),
      Exercicio(nome: "Tríceps Testa", series: 3, repeticoes: 10),
    ]),
    CategoriaTreino(nome: "Bíceps", exercicios: [
      Exercicio(nome: "Rosca Direta", series: 3, repeticoes: 12),
      Exercicio(nome: "Rosca Alternada", series: 3, repeticoes: 12),
    ]),
    CategoriaTreino(nome: "Peito", exercicios: [
      Exercicio(nome: "Supino Reto", series: 4, repeticoes: 10),
      Exercicio(nome: "Crucifixo Inclinado", series: 3, repeticoes: 12),
    ]),
  ];

  final List<CategoriaTreinoDetalhado> treinosSemana = [
    CategoriaTreinoDetalhado(nome: "Segunda-Feira", exercicios: [
      ExercicioDetalhados(
        nome: "Supino Reto",
        seriesCadastradas: 4,
        repeticoesCadastradas: 10,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Crucifixo Inclinado",
        seriesCadastradas: 3,
        repeticoesCadastradas: 12,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Tríceps Pulley",
        seriesCadastradas: 6,
        repeticoesCadastradas: 8,
        series: []
      ),
    ]),
    CategoriaTreinoDetalhado(nome: "Terça-Feira", exercicios: [
      ExercicioDetalhados(
        nome: "Puxador Alto Aberto",
        seriesCadastradas: 4,
        repeticoesCadastradas: 10,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Remada Curvada",
        seriesCadastradas: 4,
        repeticoesCadastradas: 10,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Rosca Direta",
        seriesCadastradas: 3,
        repeticoesCadastradas: 12,
        series: []
      ),
    ]),
    CategoriaTreinoDetalhado(nome: "Quarta-Feira", exercicios: [
      ExercicioDetalhados(
        nome: "Agachamento Livre",
        seriesCadastradas: 3,
        repeticoesCadastradas: 20,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Leg Press 45°",
        seriesCadastradas: 4,
        repeticoesCadastradas: 8,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Cadeira Extensora",
        seriesCadastradas: 4,
        repeticoesCadastradas: 8,
        series: []
      ),
    ]),
    CategoriaTreinoDetalhado(nome: "Quinta-Feira", exercicios: [
      ExercicioDetalhados(
        nome: "Descanso",
        seriesCadastradas: 3,
        repeticoesCadastradas: 12,
        series: []
      ),
    ]),
    CategoriaTreinoDetalhado(nome: "Sexta-Feira", exercicios: [
      ExercicioDetalhados(
        nome: "Desenvolvimento Halteres",
        seriesCadastradas: 4,
        repeticoesCadastradas: 20,
        series: [],
      ),
      ExercicioDetalhados(
        nome: "Elevação Lateral",
        seriesCadastradas: 4,
        repeticoesCadastradas: 12,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Tríceps Testa",
          seriesCadastradas: 3,
          repeticoesCadastradas: 8,
        series: []
      ),
    ]),
    CategoriaTreinoDetalhado(nome: "Sábado", exercicios: [
      ExercicioDetalhados(
        nome: "Levantamento Terra",
        seriesCadastradas: 4,
        repeticoesCadastradas: 10,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Remada Sentada",
        seriesCadastradas: 4,
        repeticoesCadastradas: 12,
        series: []
      ),
      ExercicioDetalhados(
        nome: "Rosca Alternada",
        seriesCadastradas: 4,
        repeticoesCadastradas: 20,
        series: []
      ),
    ]),
    CategoriaTreinoDetalhado(nome: "Domingo", exercicios: [
      ExercicioDetalhados(
        nome: "Descanso",
        series: []
      ),
    ]),
  ];

  int? _opcaoSelecionada = 0;

  final List<String> _opcoes = ['Treino', 'Seu Treino', 'Criar'];


  // --- chama as telas dependendo do que for selecionado ---
  Widget _carregarConteudo() {
    switch (_opcaoSelecionada) {
      case 0:
        return SugestaoTreinos();
      case 1:
        return SeuTreino();
      case 2:
        return PgCadastroTreino();
      default:
        return const Center(child: Text('Nenhuma opção selecionada'));
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
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List<Widget>.generate(_opcoes.length, (int index) {
                    final bool isSelected = _opcaoSelecionada == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _opcaoSelecionada = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _opcoes[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 2,
                              width: 80,
                              color: isSelected ? Colors.black : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 12),

              _carregarConteudo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget SugestaoTreinos(){
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: treinos.length,
            separatorBuilder: (context, index) => SizedBox(height: 22),
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
    );
  }

  Widget SeuTreino(){
    return  Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: treinosSemana.length,
            separatorBuilder: (context, index) => SizedBox(height: 22),
            itemBuilder: (context, index) {
              final treino = treinosSemana[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PG_Exercicius_Detalhados(
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
    );
  }
}






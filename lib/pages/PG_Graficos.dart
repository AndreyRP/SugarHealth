import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/textoAvaliacao.dart';

import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';

class PgGraficos extends StatefulWidget {
  const PgGraficos({super.key});

  @override
  State<PgGraficos> createState() => _PgGraficosState();
}

class _PgGraficosState extends State<PgGraficos> {
  @override

  final List<double> valoresSemana = [60, 80, 85, 60, 70, 60, 68];
  final List<String> diasDaSemana = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Cabecalho(),
        drawer: MenuRetratio(),
        backgroundColor: const Color(0xffB4EAE1),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),

                      Text('Grafico',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: .bold,
                        color: Colors.black
                      ),),

                      Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 20, 16),
                decoration: BoxDecoration(
                  color: const Color(0xffA8D3F6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                height: 260,
                child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  minY: 0,
                  // Configuração dos eixos X e Y
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    // Eixo Y (Valores à esquerda)
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          if (value == 0) return const SizedBox.shrink();
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                    // Eixo X (Dias da semana na parte inferior)
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < diasDaSemana.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                diasDaSemana[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: false), // Desativa linhas de grade
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.black, width: 1.5), // Linha do eixo Y
                      bottom: BorderSide(color: Colors.black, width: 1.5), // Linha do eixo X
                    ),
                  ),
                  // Construção das barras
                  barGroups: List.generate(valoresSemana.length, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: valoresSemana[index],
                          color: const Color(0xFF17B890),
                          width: 18,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          borderSide: const BorderSide(color: Colors.black, width: 1.2), // Borda escura na barra
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),

                      Container(
                          padding: const EdgeInsets.fromLTRB(16, 24, 20, 16),
                          decoration: BoxDecoration(
                            color: const Color(0xffA8D3F6),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Column(
                            spacing: 12,
                            children: [
                              Text('Dias',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: .bold,
                                    color: Colors.black
                                ),),

                              ...List.generate(diasDaSemana.length, (index) {
                                String dia = diasDaSemana[index];
                                double valor = double.parse(valoresSemana[index].toStringAsFixed(2));

                                return Row(
                                  children: [
                                    Text('$dia: Glicose em $valor Mg/dl',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                    )),
                                  ],
                                );
                              }),
                            ],
                          )
                      ),
                    ]
                )
            )
        )
    );
  }
}

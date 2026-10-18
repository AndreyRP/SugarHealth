import 'package:flutter/material.dart';

import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';
import '../widgets/textoAvaliacao.dart';

class PgConfiguracaoSistema extends StatefulWidget {
  const PgConfiguracaoSistema({super.key});

  @override
  State<PgConfiguracaoSistema> createState() => _PgConfiguracaoSistemaState();
}

class _PgConfiguracaoSistemaState extends State<PgConfiguracaoSistema> {
  @override

  double _tamanhoFonte = 16;
  bool _isOpen = false;


  Widget build(BuildContext context) {

    double fonte = _tamanhoFonte.truncateToDouble();

    return Scaffold(
        appBar: Cabecalho(),
        drawer: MenuRetratio(),
        backgroundColor: const Color(0xffB4EAE1),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                        SizedBox(height: 20),

                        Text('CONFIGURAÇÃO',
                          style: TextStyle(
                            fontWeight: .bold,
                            fontSize: 24,
                            color: Colors.black
                          ),
                        ),

                        SizedBox(height: 20),

                        Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2.5),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tamanho da Fonte',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text('$fonte',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: .bold,
                          fontSize: fonte
                        ),)
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        // "A" Pequeno
                        Text(
                          'A',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        // Slider estilizado
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 1.5,
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.black,
                              thumbColor: const Color(0xFF3396D3), // Azul da imagem
                              overlayColor: const Color(0xFF3396D3).withOpacity(0.2),
                              // Formato e borda preta para a bolinha (thumb)
                              thumbShape: const _CustomSliderThumbCircle(
                                thumbRadius: 10,
                                borderColor: Colors.black,
                                borderWidth: 2.0,
                              ),
                            ),
                            child: Slider(
                              value: _tamanhoFonte,
                              min: 12.0,
                              max: 20.0,
                              onChanged: (double novoValor) {
                                setState(() {
                                  _tamanhoFonte = novoValor;
                                });
                              },
                            ),
                          ),
                        ),

                        // "A" Grande
                        Text(
                          'A',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                            child:
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextoAvaliacao('Alterar Senha'),
                                  Icon(Icons.edit),
                                ]
                            )
                        ),

                        GestureDetector(
                        onTap: () {
                          setState(() {
                            _isOpen = !_isOpen;
                          });
                        },
                        child: _isOpen ?
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 12,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.help),
                                          SizedBox(width: 8),
                                          TextoAvaliacao('Ajuda e Suporte'),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_up)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextoAvaliacao('Fale Conosco')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextoAvaliacao('Telefone'),
                                      SizedBox(width: 12),
                                      TextoAvaliacao('(45) 3038-4040')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextoAvaliacao('Celular'),
                                      SizedBox(width: 12),
                                      TextoAvaliacao('(45) 99988-5454')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextoAvaliacao('E-mail'),
                                      SizedBox(width: 12),
                                      TextoAvaliacao('sugarhealth@gmail.com')
                                    ],
                                  ),
                                ]
                            )
                        )
                            : Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.help),
                                    SizedBox(width: 8),
                                    TextoAvaliacao('Ajuda e Suporte'),
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                        ),
                      ),

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.warning),
                                SizedBox(width: 12,),
                                TextoAvaliacao('Segurança'),
                              ]
                          )
                      ),

                        SizedBox(height: 68),

                        ElevatedButton(onPressed: () => (),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff97F8ED),
                              side: const BorderSide(color: Colors.black, width: 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              minimumSize: const Size(220, 42),
                            ),
                            child: TextoAvaliacao('Voltar')),
                    ],
                ),
            ),
        ),
    );
  }
}

class _CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final Color borderColor;
  final double borderWidth;

  const _CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow, // <-- Alterado de "size" para "sizeWithOverflow"
      }) {
    final Canvas canvas = context.canvas;

    // Preenchimento (Azul)
    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    // Borda (Preta)
    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
